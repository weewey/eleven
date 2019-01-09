class Photo < ApplicationRecord
  belongs_to :race
  has_and_belongs_to_many :runners

  mount_uploader :image, ImageUploader

end
