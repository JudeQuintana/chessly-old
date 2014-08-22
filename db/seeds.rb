# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
GameList.destroy_all
Game.destroy_all

user1 = User.create!(
  email: 'jude@g.com',
  username: 'Jude',
  password: 'jude',
  password_confirmation: 'jude',
  uscf: 1800
)

user2 = User.create!(
  email: 'james@g.com',
  username: 'James',
  password: 'james',
  password_confirmation: 'james',
  uscf: 1800
)

GameList.create!(
  user_id: user1.id,
  title: 'My Games'
)

GameList.create!(
  user_id: user2.id,
  title: 'My Games'
)