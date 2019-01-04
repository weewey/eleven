class RaceParticipation < ApplicationRecord
  belongs_to :runner
  belongs_to :race

end
