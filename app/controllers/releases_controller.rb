class ReleasesController < ApplicationController
  def new
    @release = Release.new
  end

  def create
    @band = Band.find(params[:id])
    @release = Release.new(release_params)
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

  private

  def release_params
    params.require(:release).permit(
      :title, :track_list, :year_released, :record_label,
      :record_label_url, :catalog_number, :wiki_link, :type, :length,
      :private?
    )
  end
end
