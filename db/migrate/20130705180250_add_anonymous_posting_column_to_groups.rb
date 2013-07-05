class AddAnonymousPostingColumnToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :only_members, :boolean, default: true, null: false
    
    add_index :groups, :only_members
  end
end
