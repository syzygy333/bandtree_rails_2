class AddRolesToArtistsReleases < ActiveRecord::Migration
  def change
    add_column :artists_releases, :role, :string
  end
end
