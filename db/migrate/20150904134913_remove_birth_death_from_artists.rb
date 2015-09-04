class RemoveBirthDeathFromArtists < ActiveRecord::Migration
  def up
    remove_column :artists, :birth_date
    remove_column :artists, :death_date
  end

  def down
    add_column :artists, :birth_date, :date
    add_column :artists, :death_date, :date
  end
end
