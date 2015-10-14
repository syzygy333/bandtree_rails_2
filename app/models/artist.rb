class Artist < ActiveRecord::Base
  mount_uploader :portrait, ArtistPortraitUploader

  include PgSearch
  multisearchable :against => [:first_name, :middle_name,
    :last_name, :stage_name]

  has_and_belongs_to_many :bands
  has_and_belongs_to_many :releases

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
