class Tag < ActiveRecord::Base
  belongs_to :post, counter_cache: true

  def self.get_tags_by filters, limit=20
    p filters
  end

end