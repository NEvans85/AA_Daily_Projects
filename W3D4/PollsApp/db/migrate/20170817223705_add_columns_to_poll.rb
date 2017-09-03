class AddColumnsToPoll < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :author_id, :integer, null: false
    add_column :polls, :title, :string, null: false
  end
end
