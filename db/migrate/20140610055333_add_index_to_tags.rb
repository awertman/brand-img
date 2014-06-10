class AddIndexToTags < ActiveRecord::Migration
  def up
    add_index :tags, :post_id
  end

  def down
    remove_index :tags, :post_id
  end
end
