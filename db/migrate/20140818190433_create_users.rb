class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      t.integer :uscf
      t.index :email, unique: true
      t.timestamps
    end
  end
end
