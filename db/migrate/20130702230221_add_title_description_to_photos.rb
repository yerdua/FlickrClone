class AddTitleDescriptionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :description, :text
    add_column :photos, :title, :string
  end
end
