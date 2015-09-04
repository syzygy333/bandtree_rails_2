class RemoveBandIdFromReleases < ActiveRecord::Migration
  def up
    remove_column :releases, :band_id
  end

  def down
    add_column :releases, :band_id, :integer
  end
end
