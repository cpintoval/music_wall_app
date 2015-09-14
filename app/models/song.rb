class Song < ActiveRecord::Base

  validates :title, :author, presence: true

end