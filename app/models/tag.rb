class Tag < ActiveRecord::Base
  belongs_to :post, counter_cache: true

  def self.get_tags_by filtered_tags, limit=20
    filtered_posts = Post.joins(:tags).where(tags: {description: filtered_tags}).select(:post_id).group(:post_id).having("count(tags) = ?", filtered_tags.length)
    filtered_posts = filtered_posts.map { |e| e.post_id  }

    Post.includes(:tags).where(id: filtered_posts).joins(:tags).select(:description ).group(:description).order('count_description desc').count.first(limit)
  end

end