class AddColumnsToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :text, :text, null: false
    add_column :questions, :poll_id, :integer, null: false
    add_index :questions, :poll_id
  end
end
