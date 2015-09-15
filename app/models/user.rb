class User < ActiveRecord::Base

  has_many :songs
  validates :first_name, :last_name, :username, :password, presence: true

end