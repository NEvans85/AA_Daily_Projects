class AddColumnsToAnswerChoices < ActiveRecord::Migration[5.1]
  def change
    add_column :answer_choices, :question_id, :integer, null: false
    add_column :answer_choices, :text, :text, null: false
    add_index :answer_choices, :question_id
  end
end
