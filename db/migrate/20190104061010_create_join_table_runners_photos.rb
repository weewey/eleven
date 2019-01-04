class CreateJoinTableRunnersPhotos < ActiveRecord::Migration[5.2]
  def change
    create_join_table :runners, :photos do |t|
      t.index :runner_id
      t.index :photo_id
    end
  end
end
