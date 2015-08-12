class Release < ActiveRecord::Base
  belongs_to :band

  validates :band, presence: true
  validates :title, presence: true
  validates :track_list, presence: true
  validates :record_label, presence: true
end
