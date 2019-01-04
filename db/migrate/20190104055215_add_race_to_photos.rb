class AddRaceToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_reference :photos, :race, index: true, foreign_key: true
  end
end
