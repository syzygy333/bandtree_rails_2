class AddBandIdToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :band_id, :integer, null: false
  end
end
