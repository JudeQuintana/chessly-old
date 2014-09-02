class Game < ActiveRecord::Base
  # belongs_to :user
  has_one :note, dependent: :destroy

  validates :white, :black, :result, presence: true

end