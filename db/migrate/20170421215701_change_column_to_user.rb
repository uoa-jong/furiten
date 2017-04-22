class ChangeColumnToUser < ActiveRecord::Migration[5.0]
  def up
    rename_column :users, :password, :password_digest
  end

end
