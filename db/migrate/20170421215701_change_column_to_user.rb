class ChangeColumnToUser < ActiveRecord::Migration[5.0]
  def up
    rename_column :users, :password, :password_digest
    change_column :users, :total_score, :decimal, null: false, default: 0
  end

  def down
  	change_column :users, :total_score, :float, null: false, default: 0
  end

end
