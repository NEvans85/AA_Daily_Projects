class AddColumnsToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :user_id, :integer, null: false
    add_column :responses, :answer_choice_id, :integer, null: false
    add_index :responses, :user_id
    add_index :responses, :answer_choice_id
  end
end
