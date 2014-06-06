class Brand < ActiveRecord::Base
  has_many :posts

  # printing item for n+1 test

  def self.get_filtered_tags_by brand, limit=20
    p Post.includes(:tags).where(brand_id: brand).joins(:tags).select(:description ).group(:description).order('count_description desc').count.first(limit)
  end

end