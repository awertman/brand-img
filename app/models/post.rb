class Post < ActiveRecord::Base
  has_many :tags
  validates :platform_id, uniqueness: { case_sensitive: false, message: "that platform is already uploaded" }


  def self.get_and_sort_by_tag_matches brand, base_tags
    # p Post.where(brand_id: brand.id).select('posts.*, count(posts.id)').group(:id)
    filtered_tags = base_tags.map { |description,count| description }
    tag_count = Tag.where(description: filtered_tags).select(:post_id).group(:post_id).order('count_post_id desc').count
    posts = Post.includes(:tags).where(brand_id: brand).map { |post| [post, count: tag_count[post.id]] }
    posts.sort_by { |post,count| - count[:count] }
  end

end