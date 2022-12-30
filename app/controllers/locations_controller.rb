class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit,:update, :destroy]
  before_action :require_user, :locations

  def index 
    @location = Location.all
  end 

  def new 
    @location = Location.new
  end 

  def create 
    @location = Location.new(location_params)
    if @location.save
      flash[:notice] = "location is added successfully"
    redirect_to  locations_path(@location)
    else
       render 'new'
    end
  end 
  
  def show 

  end
  
  def edit

  end

  def update
    if @location.update(location_params)
      flash[:notice] = " Location name Edited Successfully"
      redirect_to  locations_path(@location)
    else 
      render 'edit'
    end 
  end
    
  def destroy
    @location.destroy
    redirect_to locations_path
  end 

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:place , :region_id)
  end

end