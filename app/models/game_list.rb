class GameList < ActiveRecord::Base
  has_many :games, dependent: :destroy

  validates :title, presence: true

end