class AddIndicesToPolls < ActiveRecord::Migration[5.1]
  def change
    add_index :polls, :author_id
    add_index :polls, :title, unique: true
  end
end
