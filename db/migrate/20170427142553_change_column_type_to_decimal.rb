class ChangeColumnTypeToDecimal < ActiveRecord::Migration[5.0]
    def up
    change_column :users, :total_score, :decimal, null: false, default: 0
    change_column :games, :e_score, :decimal, null: false, default: 0
    change_column :games, :s_score, :decimal, null: false, default: 0
    change_column :games, :w_score, :decimal, null: false, default: 0
    change_column :games, :n_score, :decimal, null: false, default: 0
  end

  def down
  	change_column :users, :total_score, :float, null: false, default: 0
  	change_column :games, :e_score, :float, null: false, default: 0
  	change_column :games, :s_score, :float, null: false, default: 0
  	change_column :games, :w_score, :float, null: false, default: 0
  	change_column :games, :n_score, :float, null: false, default: 0
  end
end
