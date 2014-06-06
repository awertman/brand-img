class Brand < ActiveRecord::Base
  has_many :posts

  def self.get_filtered_tags_by brand, limit=20
    Post.includes(:tags).where(brand_id: brand).joins(:tags).select(:description ).group(:description).order('count_description desc').count.first(limit)
  end

end