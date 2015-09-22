class Release < ActiveRecord::Base
  mount_uploader :release_art, PhotoUploader
  paginates_per 500

  has_and_belongs_to_many :bands
  has_and_belongs_to_many :artists, -> { uniq }

  validates :title, presence: true
  validates :track_list, presence: true
  validates :record_label, presence: true
end
