class Game < ActiveRecord::Base
  belongs_to :user

  validates :white, :black, :result, :pgn, presence: true

end