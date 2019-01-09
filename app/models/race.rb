class Race < ApplicationRecord
  has_many :photographers, through: :assignment
  has_many :photos
  has_many :runners, through: :race_participation

  validates_presence_of :name, :start_date
  validates_numericality_of :distance, greater_than_or_equal_to: 0

  def name_with_year
    "#{name} #{start_date.year}"
  end

end
