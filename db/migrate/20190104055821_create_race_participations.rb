class CreateRaceParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :race_participations do |t|
      t.string :bib_number
      t.belongs_to :race, index: true
      t.belongs_to :runner, index: true

      t.timestamps
    end
  end
end
