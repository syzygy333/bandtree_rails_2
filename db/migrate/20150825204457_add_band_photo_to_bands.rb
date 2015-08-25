class AddBandPhotoToBands < ActiveRecord::Migration
  def change
    add_column :bands, :band_photo, :string
  end
end
