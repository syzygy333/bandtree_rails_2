class Artist < ActiveRecord::Base
  mount_uploader :portrait, ArtistPortraitUploader

  include PgSearch
  multisearchable against: [:first_name, :middle_name,
    :last_name, :stage_name]

  has_and_belongs_to_many :bands
  has_and_belongs_to_many :releases

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def connectedness
    artist_list = []
    releases.each do |release|
      release.artists.each do |artist|
        if artist_list.include?(artist.full_name) == false
          artist_list << artist.full_name
        end
      end
    end
    if artist_list.count > 0
      artist_list.count - 1
    end
  end

  def stage_name_or_full_name
    if stage_name_preferred == true
      stage_name
    else
      full_name
    end
  end
end
