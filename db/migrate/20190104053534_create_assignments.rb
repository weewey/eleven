class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.belongs_to :race, index: true
      t.belongs_to :photographer, index: true

      t.timestamps
    end
  end
end
