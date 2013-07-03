class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :owner_id
      t.string  :name, :null => false
      t.text    :description
      t.timestamps
    end
    
    add_index :albums, :owner_id
    add_index :albums, :name
  end
end
