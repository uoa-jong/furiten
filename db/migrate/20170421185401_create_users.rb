class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :student_is
      t.string :user_name
      t.string :password
      t.integer :role_id
      t.time :add_user

      t.timestamps
    end
  end
end
