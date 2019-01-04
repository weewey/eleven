class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name
      t.datetime :start_date
      t.float :distance

      t.timestamps
    end
  end
end
