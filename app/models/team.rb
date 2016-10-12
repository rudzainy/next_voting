class Team < ApplicationRecord

  mount_uploader :image, ImageUploader
  has_many :notes

end
