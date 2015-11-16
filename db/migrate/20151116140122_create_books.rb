class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :image_url
      t.integer :no_pages
      t.string :condition
      t.string :synopsis
    end
  end
end
