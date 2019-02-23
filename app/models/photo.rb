class Photo < ApplicationRecord
  belongs_to :race
  belongs_to :photographer, optional: true
  has_and_belongs_to_many :runners

  mount_uploader :image, ImageUploader

end
