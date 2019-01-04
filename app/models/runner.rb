class Runner < ApplicationRecord
  has_many :race, through: :race_participation
  has_and_belongs_to_many :photos

end
