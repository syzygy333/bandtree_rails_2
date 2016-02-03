class HomesController < ApplicationController
  def index
    @bands = Band.all.count
    @releases = Release.all.count
    @artists = Artist.all.count
    @most_recent_band = Band.last
    @most_recent_release = Release.last
    @most_recent_artist = Artist.last
  end
end
