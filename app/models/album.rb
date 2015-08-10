class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :track_list, presence: true
  validates :record_label, presence: true
end
