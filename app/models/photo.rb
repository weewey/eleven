class Photo < ApplicationRecord
  include PhotoScopes

  belongs_to :race
  belongs_to :photographer, optional: true
  has_and_belongs_to_many :runners

  mount_uploader :image, ImageUploader

  validates_inclusion_of :race_official, in: [true, false], :message => "value is required"

end
