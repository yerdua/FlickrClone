class CreatePhotoShares < ActiveRecord::Migration
  def change
    create_table :photo_shares do |t|
      t.integer :photo_id
      t.integer :group_id
      t.timestamps
    end
    
    add_index :photo_shares, :photo_id
    add_index :photo_shares, :group_id
  end
end
