class Post < ActiveRecord::Base
  has_many :tags
  validates :platform_id, uniqueness: { case_sensitive: false, message: "that platform is already uploaded" }


  def self.get_posts_and_sort_by_tag_matches brand, filters, base_tags
    tag_count = Post.count_tags(base_tags)
    posts = Post.get_posts_matching_filters(brand, filters)
    Post.count_tags_in_posts( posts, tag_count)
  end

  def self.count_tags base_tags
    filtered_tags = base_tags.map { |description,count| description }
    tag_count = Tag.where(description: filtered_tags).select(:post_id).group(:post_id).order('count_post_id desc').count
  end

  def self.get_posts_matching_filters brand, filters
    posts = Post.where(brand_id: brand.id).joins(:tags).where(tags: {description: filters}).select("post_id, count(tags)").group(:post_id).having("count(tags) = ?", filters.length)
    posts = posts.map { |e| e.post_id  }
  end

  def self.count_tags_in_posts posts, tag_count
    counted_posts =  Post.includes(:tags).where(id: posts).map { |post| [post, tag_count[post.id]] }
    counted_posts.sort_by { |post,count| -count }
  end

end