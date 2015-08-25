class Band < ActiveRecord::Base
  mount_uploader :band_photo, BandPhotoUploader
  has_many :releases

  validates :name, presence: true
end
