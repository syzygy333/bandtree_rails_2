class Album < ActiveRecord::Base
  belongs_to :band

  validates :title, presence: true
  validates :track_list, presence: true
  validates :record_label, presence: true
end
