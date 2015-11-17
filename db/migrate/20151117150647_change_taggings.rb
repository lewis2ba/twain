class ChangeTaggings < ActiveRecord::Migration
  def change
      remove_column :taggings, :taggings_id
      remove_column :taggings, :plugin_id
  end
end
