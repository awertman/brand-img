class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :brand
      t.string :platform_id
      t.date :created_time
      t.string :username
      t.string :image_link
      t.integer :likes
      t.integer :latitude
      t.integer :longitude
    end
  end
end
