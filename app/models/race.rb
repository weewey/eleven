class Race < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :photographers, :through => :assignments
  has_many :photos, dependent: :destroy
  has_many :race_participations, dependent: :destroy
  has_many :runners, :through => :race_participations

  validates_presence_of :name, :start_date
  validates_numericality_of :distance, greater_than_or_equal_to: 0

  def name_with_year
    "#{name} #{start_date.year}"
  end

end
