class Runner < ApplicationRecord
  has_many :race_participations
  has_many :races, through: :race_participations
  has_and_belongs_to_many :photos
end
