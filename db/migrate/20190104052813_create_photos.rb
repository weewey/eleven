class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :tags, array: true
      t.string :image

      t.timestamps
    end
  end
end
