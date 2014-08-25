class Game < ActiveRecord::Base
  # belongs_to :user
  has_one :note

  validates :white, :black, :result, :pgn, presence: true

end