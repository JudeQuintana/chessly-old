class CreateGameLists < ActiveRecord::Migration
  def change
    create_table :game_lists do |t|
      t.integer :user_id
      t.string :title
    end
  end
end
