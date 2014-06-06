class Brand < ActiveRecord::Base
  has_many :posts

  def self.get_filtered_tags_by brand, limit=20
    Post.includes(:tags).where(brand_id: brand.id).joins(:tags).select(:description ).group(:description).order('count_description desc').count.first(limit+1).reject {|tag| tag[0]==brand.name}
  end

  def self.get_and_sort_by_tag_matches brand, base_tags
    # p Post.where(brand_id: brand.id).select('posts.*, count(posts.id)').group(:id)
    filtered_tags = base_tags.map { |description,count| description }
    tag_count = Tag.where(description: filtered_tags).select(:post_id).group(:post_id).order('count_post_id desc').count
    posts = Post.includes(:tags).where(brand_id: brand.id).map { |post| [post, count: tag_count[post.id]] }

    posts.sort_by {|post,count| count[:count] ? - count[:count] : 0 }
  end

end