class HomesController < ApplicationController
  def index
    @total_bands = Band.all.count
    @total_releases = Release.all.count
    @total_artists = Artist.all.count
    @newest_band = Band.last
    @newest_release = Release.last
    @newest_artist = Artist.last
  end
end
