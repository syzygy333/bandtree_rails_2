class Release < ActiveRecord::Base
  mount_uploader :release_art, PhotoUploader

  belongs_to :band

  validates :band, presence: true
  validates :title, presence: true
  validates :track_list, presence: true
  validates :record_label, presence: true
end
