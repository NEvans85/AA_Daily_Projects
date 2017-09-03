class CreateQuesetions < ActiveRecord::Migration[5.1]
  def change
    create_table :quesetions do |t|

      t.timestamps
    end
  end
end
