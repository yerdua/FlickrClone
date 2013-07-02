class RemoveDefaultEmailFromUserTable < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :default => nil
  end
end
