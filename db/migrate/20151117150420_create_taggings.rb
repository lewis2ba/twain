class CreateTaggings < ActiveRecord::Migration
  def change
    change_table :taggings do |t|
      t.references :book
      t.references :tag
    end
  end
end
