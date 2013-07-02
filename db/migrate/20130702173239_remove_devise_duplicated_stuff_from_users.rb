class RemoveDeviseDuplicatedStuffFromUsers < ActiveRecord::Migration
  def change
    remove_index :users, :session_token
    
    remove_column :users, :password_digest
    remove_column :users, :session_token
  end
end
