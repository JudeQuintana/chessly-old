class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.string :event
      t.string :site
      t.string :round
      t.string :date
      t.string :white
      t.string :black
      t.string :result
      t.text :pgn
      t.timestamps
    end
  end
end
