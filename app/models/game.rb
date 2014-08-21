class Game < ActiveRecord::Base
  belongs_to :game_list

  validates :white, :black, :result, :pgn, presence: true

end