class AddColumnUserforonlist < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :onlist, :string
  end
end
