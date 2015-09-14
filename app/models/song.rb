class Song < ActiveRecord::Base

  validates :title, :author, presence: true
  # validate :url_validator

  # def url_validator
  #   if !url || url == ""
  #     url = "http://gadgtmag.com/media/uploads/2012/10/album-art-missing.png"
  #     self.save
  #   end
  # end

end