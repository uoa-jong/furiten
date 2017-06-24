class AddColumnToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :rule_id, :integer
  end
end
