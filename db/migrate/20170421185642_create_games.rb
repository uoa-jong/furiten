class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :e_userid
      t.float :e_score
      t.integer :s_userid
      t.float :s_score
      t.integer :w_userid
      t.float :w_score
      t.integer :n_userid
      t.float :n_score
      t.time :add_time
      t.datetime :game_date

      t.timestamps
    end
  end
end
