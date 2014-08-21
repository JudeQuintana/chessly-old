class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :game_id
      t.text :note
      t.timestamps
    end
  end
end
