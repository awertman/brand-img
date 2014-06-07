class Tag < ActiveRecord::Base
  belongs_to :post

  def self.get_tags_by brand, filters, limit=20
    filtered_posts = Post.where(brand_id: brand.id).joins(:tags).where(tags: {description: filters}).select(:post_id).group(:post_id).having("count(tags) = ?", filters.length)
    filtered_posts = filtered_posts.map { |e| e.post_id  }
    tag_count = Post.includes(:tags).where(id: filtered_posts).joins(:tags).select(:description ).group(:description).order('count_description desc').count.first(limit+1+filters.length)
  end

  def self.remove_filters_from_listing brand, filters, tag_options, limit=20
    updated_options = tag_options.reject do |tag,count|
      tag == brand.name || filters.any? { |filter| filter == tag }
    end
  end

end