class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :total_score, :float
    add_column :users, :game_count, :integer
  end
end
