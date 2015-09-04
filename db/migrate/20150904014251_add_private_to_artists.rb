class AddPrivateToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :private?, :boolean, default: false
  end
end
