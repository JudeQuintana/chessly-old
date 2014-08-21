class CreateGameLists < ActiveRecord::Migration
  def change
    create_table :game_lists do |t|
      t.string :title
    end
  end
end
