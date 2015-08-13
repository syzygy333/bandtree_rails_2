class ReleasesController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
    @release = Release.new
  end

  def create
    @band = Band.find(params[:band_id])
    @release = Release.new(release_params)
    @release.band_id = @band.id
    if current_user == nil
      flash[:alert] = "You must be signed in to do that."
      render :new
    elsif @release.save
      flash[:success] = "Release added."
      redirect_to band_path(@band)
    else
      flash[:alert] = @release.errors.full_messages.join(".  ")
      render :new
    end
  end

  def edit
    @band = Band.find(params[:band_id])
    @release = Release.find(params[:id])
  end

  def update
    @band = Band.find(params[:band_id])
    @release = Release.find(params[:id])
    @release.band_id = @band.id
    if current_user == nil
      flash[:alert] = "You must be signed in to do that."
      redirect_to band_path(@band)
    elsif @release.update(release_params)
      flash[:success] = "Release updated."
      redirect_to band_path(@band)
    else
      flash[:alert] = @release.errors.full_messages.join(".  ")
      render :edit
    end
  end

  private

  def release_params
    params.require(:release).permit(
      :band_id, :title, :track_list, :year_released, :record_label,
      :record_label_url, :catalog_number, :wiki_link, :release_type, :release_length,
      :private?
    )
  end
end
