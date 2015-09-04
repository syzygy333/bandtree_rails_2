class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.limit(30).order(:last_name)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if current_user
      @artist.save
      flash[:success] = "Artist added."
      redirect_to artist_path(@artist)
    elsif current_user == nil
      flash[:alert] = "You must be signed in to do that."
      render :new
    else
      flash[:alert] = @artist.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @releases = @artist.releases
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if current_user
      @artist.update(artist_params)
      flash[:success] = "Artist updated."
      redirect_to artist_path(@artist)
    elsif current_user == nil
      flash[:alert] = "You must be signed in to do that."
      redirect_to artist_path(@artist)
    else
      flash[:alert] = @artist.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    if current_user
      @artist.destroy
      flash[:success] = "Artist deleted."
      redirect_to artists_path
    else
      flash[:alert] = "You must be signed in to do that."
      redirect_to artist_path(@artist)
    end
  end

  private

  def artist_params
    params.require(:artist).permit(
      :first_name, :middle_name, :last_name, :stage_name,
      :stage_name_preferred?, :birth_date, :death_date, :biography,
      :official_link, :wiki_link, :portrait, :private?
    )
  end
end
