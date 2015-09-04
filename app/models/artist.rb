class Artist < ActiveRecord::Base
  mount_uploader :portrait, PhotoUploader

  has_and_belongs_to_many :bands
  has_and_belongs_to_many :releases

  validates :first_name, presence: true
  validates :last_name, presence: true
end
