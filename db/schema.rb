# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140902215409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_lists", force: true do |t|
    t.integer "user_id"
    t.string  "title"
  end

  create_table "games", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_list_id"
    t.string   "event"
    t.string   "site"
    t.string   "round"
    t.string   "date"
    t.string   "white"
    t.string   "black"
    t.string   "result"
    t.text     "pgn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes",        default: ""
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.integer  "uscf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
