class LocationsController < ApplicationController

  before_action(:find_location, only: [:show, :edit, :update, :destroy])
  before_action(:require_login)

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      redirect_to new_location_path
    end
  end

  def show

  end

  def edit

  end

  def update
    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      redirect_to edit_location_path(@location)
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(
      :address,
      :email,
      :phone_number,
      :name,
      :opening_time,
      :closing_time)
  end

  def find_location
    @location = Location.find(params[:id])
  end

  def require_admin

  end

end
