class ReleasesController < ApplicationController
  def index
    @releases = Release.all.limit(30).order(:title)
  end

  def new
    @band = Band.find(params[:band_id])
    @release = Release.new
  end

  def create
    @band = Band.find(params[:band_id])
    @release = Release.new(release_params)
    if current_user
      @release.save
      @band.releases << @release
      flash[:success] = "Release added."
      redirect_to release_path(@release)
    elsif current_user == nil
      flash[:alert] = "You must be signed in to do that."
      render :new
    else
      flash[:alert] = @release.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @release = Release.find(params[:id])
    @band = Band.find(@release.bands.last.id)
  end

  def edit
    @release = Release.find(params[:id])
    @band = Band.find(@release.bands.last.id)
  end

  def update
    @release = Release.find(params[:id])
    @band = Band.find(@release.bands.last.id)
    if current_user
      @release.update(release_params)
      flash[:success] = "Release updated."
      redirect_to release_path(@release)
    elsif current_user == nil
      flash[:alert] = "You must be signed in to do that."
      redirect_to release_path(@release)
    else
      flash[:alert] = @release.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def destroy
    @release = Release.find(params[:id])
    @band = Band.find(@release.bands.last.id)
    if current_user
      @release.destroy
      flash[:success] = "Release deleted."
      redirect_to band_path(@band)
    else
      flash[:alert] = "You must be signed in to do that."
      redirect_to band_path(@band)
    end
  end

  private

  def release_params
    params.require(:release).permit(
      :band_id, :title, :track_list, :year_released, :record_label,
      :record_label_url, :catalog_number, :wiki_link, :release_type,
      :release_length, :release_art, :private?
    )
  end
end
