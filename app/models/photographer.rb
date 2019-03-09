class Photographer < ApplicationRecord
  has_many :assignments
  has_many :photos
  has_many :races, through: :assignments

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :email, :last_name, :first_name

end
