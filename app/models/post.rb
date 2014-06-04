class Post < ActiveRecord::Base
  has_many :tags
  validates :platform_id, uniqueness: { case_sensitive: false, message: "that platform is already uploaded" }


end