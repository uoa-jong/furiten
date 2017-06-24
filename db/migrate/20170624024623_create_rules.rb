class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
      t.string :rule

      t.timestamps
    end
  end
end
