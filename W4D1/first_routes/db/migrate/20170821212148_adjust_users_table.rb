class AdjustUsersTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :name
    remove_column :users, :email
  end
end
