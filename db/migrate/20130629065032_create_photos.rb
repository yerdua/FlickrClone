class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.binary :data, :null => false
      t.integer :owner_id
      t.timestamps
    end
  end
end
