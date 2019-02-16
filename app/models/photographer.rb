class Photographer < ApplicationRecord
  has_many :assignment
  has_many :photos
  has_many :races, through: :assignment

  validates_presence_of :email, :last_name, :first_name

end
