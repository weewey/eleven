class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :user, index: true, foreign_key: {on_delete: :cascade}
      t.string :race
      t.string :image_url
      t.string :tags, array: true

      t.timestamps
    end
  end
end
