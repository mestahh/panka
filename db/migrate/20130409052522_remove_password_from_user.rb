class RemovePasswordFromUser < ActiveRecord::Migration
  def up
    add_column :users, :hashed_password, :string
    remove_column :users, :password
  end

  def down
  end
end
