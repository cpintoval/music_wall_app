class Song < ActiveRecord::Base

  belongs_to :user
  validates :title, :author, presence: true

end