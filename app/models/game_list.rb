class GameList < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, :uniqueness => {message: "already exists!"}

end