class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if current_user == nil
      flash[:alert] = "You must be signed in to do that."
      render :new
    elsif @album.save
      flash[:success] = "Album added."
      redirect_to band_path(@band)
    else
      flash[:alert] = @album.errors.full_messages.join(".  ")
      render :new
    end
  end

  private

  def album_params
    params.require(:album).permit(
      :title, :track_list, :year_released, :record_label,
      :record_label_url, :catalog_number, :wiki_link, :type, :length,
      :private?
    )
  end
end
