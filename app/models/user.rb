class User < ActiveRecord::Base

  has_many :songs
  has_secure_password
  validates :first_name, :last_name, :username, :password, presence: true

end