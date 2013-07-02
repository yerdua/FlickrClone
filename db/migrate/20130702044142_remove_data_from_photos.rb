class RemoveDataFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :data
  end
end
