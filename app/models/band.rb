class Band < ActiveRecord::Base
  mount_uploader :band_photo, PhotoUploader

  has_and_belongs_to_many :releases
  has_and_belongs_to_many :artists

  validates :name, presence: true
end
