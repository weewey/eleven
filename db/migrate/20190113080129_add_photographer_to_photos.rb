class AddPhotographerToPhotos < ActiveRecord::Migration[5.2]
  def up
    add_reference :photos, :photographer, index: true
  end

  def down
    remove_reference :photos, :photographer
  end

end
