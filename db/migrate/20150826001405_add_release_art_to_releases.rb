class AddReleaseArtToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :release_art, :string
  end
end
