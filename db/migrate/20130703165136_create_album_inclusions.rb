class CreateAlbumInclusions < ActiveRecord::Migration
  def change
    create_table :album_inclusions do |t|
      t.integer :photo_id, :null => false
      t.integer :album_id, :null => false
      t.timestamps
    end
    
    add_index :album_inclusions, [:photo_id, :album_id], :unique => true
    add_index :album_inclusions, :album_id
    add_index :album_inclusions, :photo_id
  end
end
