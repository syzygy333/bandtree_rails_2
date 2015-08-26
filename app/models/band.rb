class Band < ActiveRecord::Base
  mount_uploader :band_photo, PhotoUploader

  has_many :releases

  validates :name, presence: true
end
