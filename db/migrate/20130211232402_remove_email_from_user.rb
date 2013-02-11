class RemoveEmailFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :name
    add_column :users, :username, :string
  end

  def down
    add_column :users, :name, :string
    remove_column :users, :username
  end
end
