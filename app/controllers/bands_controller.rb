class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if current_user == nil
      flash[:alert] = "You must be signed in to do that."
      render :new
    elsif @band.save
      flash[:success] = "Band added."
      redirect_to band_path(@band)
    else
      flash[:alert] = @band.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if current_user
      @band.update(band_params)
      flash[:success] = "Band updated."
      redirect_to band_path(@band)
    elsif current_user == nil
      flash[:alert] = "You must be signed in to do that."
      redirect_to band_path(@band)
    else
      flash[:alert] = @band.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    if current_user
      @band.destroy
      flash[:success] = "Band deleted."
      redirect_to bands_path
    else
      flash[:alert] = "You must be signed in to do that."
      redirect_to band_path(@band)
    end
  end

  private

  def band_params
    params.require(:band).permit(
      :name, :biography, :official_link, :wiki_link, :private?
    )
  end
end
