class AddRaceOfficialFlagToPhoto < ActiveRecord::Migration[5.2]

  def up
    add_column :photos, :race_official, :boolean, :null => false, :default => false
    add_index :photos, :race_official
  end

  def down
    remove_column :photos, :race_official
  end

end
