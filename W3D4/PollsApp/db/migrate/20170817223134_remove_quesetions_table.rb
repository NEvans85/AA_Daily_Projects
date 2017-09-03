class RemoveQuesetionsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :quesetions
  end
end
