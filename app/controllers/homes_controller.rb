class HomesController < ApplicationController
  def index
    @total_bands = Band.all.count
    @total_releases = Release.all.count
    @total_artists = Artist.all.count
    @newest_band = Band.last
    @newest_release = Release.last
    @newest_artist = Artist.last
    @most_connected = most_connected
  end

  def most_connected
    connections = 0
    winner = []
    Artist.all.each do |artist|
      if artist.connectedness != nil && artist.connectedness >= connections
        connections = artist.connectedness
        winner << [artist.id, artist.connectedness]
      end
    end
    Artist.find(winner.last[0])
  end
  
end
