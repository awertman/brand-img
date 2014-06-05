class Brand < ActiveRecord::Base
  has_many :posts


  def get_filtered_tags_by brand, limit
    Post.where(brand_id: brand.id).joins(:tags).joins(:tags).select(:description ).group(:description).order('count_description desc').count
  end

end