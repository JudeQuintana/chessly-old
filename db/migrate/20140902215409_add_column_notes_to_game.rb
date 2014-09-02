class AddColumnNotesToGame < ActiveRecord::Migration
  def up
    add_column :games, :notes, :text, default: ""
  end

  def down
    remove_column :games, :notes
  end
end
