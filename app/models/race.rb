class Race < ApplicationRecord
  has_many :photographers, through: :assignment
  has_many :photos
  has_many :runners, through: :race_participation

end
