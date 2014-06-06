class Tag < ActiveRecord::Base
  belongs_to :post

  def self.get_tags_by brand, filtered_tags, limit=20
    filtered_posts = Post.where(brand_id: brand.id).joins(:tags).where(tags: {description: filtered_tags}).select(:post_id).group(:post_id).having("count(tags) = ?", filtered_tags.length)
    filtered_posts = filtered_posts.map { |e| e.post_id  }

    tag_count = Post.includes(:tags).where(id: filtered_posts).joins(:tags).select(:description ).group(:description).order('count_description desc').count
    # p "--------------- tag sort ---------------"
    # p tag_count
    # tag_count.reject! do |tag,count|
    #   tag == brand.name || filtered_tags.any? { |filter| filter==tag }
    # end
    # tag_count.first(limit)
  end

end