class Photographer < ApplicationRecord
  has_many :photos
  has_many :races, through: :assignments

end
