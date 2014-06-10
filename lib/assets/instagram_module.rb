module InstagramModule
  class Request

    def initialize
      Instagram.configure do |config|
        config.client_id = ENV['secret_id']
        config.access_token = ENV['token']
      end
    end

    def get_recent_media_by_tag tag, pages, max_id = nil
      @brand = Brand.find_by_name(tag)
      if !@brand
        p "creating new brand"
        @brand = Brand.create({name: tag})
      end
      counter = 0
      (pages).times do
        page = Instagram.tag_recent_media( tag, {max_id: max_id, count:50,} )
        extract_hashies(page)
        max_id = page.pagination.next_max_tag_id
        p "------ page #{counter+=1}-------"
      end
    end

    def extract_hashies hashie
      hashie.each do |post|
        push_to_database( format_post( post ), format_tag( post.tags ) )
      end
    end

    def format_post post
      { platform_id: post.id,
        created_time: DateTime.strptime(post.created_time,'%s'),
        username: post.user.username,
        image_link: post.images.low_resolution.url,
        likes: post.likes.count,
        latitude: post.location == nil ? nil : post.location.latitude ,
        longitude: post.location == nil ? nil : post.location.longitude }
    end

    def format_tag tags
      tags.map {|tag| {description: tag}}
    end

    def push_to_database post, tags
      post = @brand.posts.new(post)
      if post.save
        p post.created_time
        post.tags.create(tags)
      end
    end

  end

end
