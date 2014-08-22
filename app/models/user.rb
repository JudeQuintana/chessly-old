class User < ActiveRecord::Base
  has_secure_password

  has_many :game_lists

  validates :username, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 4 }

end