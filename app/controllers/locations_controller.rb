class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit,:update, :destroy]
  before_action :require_user

  # Display list of all Locations
  def index 
    @locations = Location.all
  end 
 
  # Show specific location details
  def show 
  end
  
  # Add new Location
  def new 
    @location = Location.new
  end 

  # Save new Location
  def create 
    @location = Location.new(location_params)
    if @location.save
      respond_to do|format|
        format.html {redirect_to locations_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end 
 
  # Edit specific location
  def edit
  end

  # Update specific location
  def update
    if @location.update(location_params)
      respond_to do |format|
        format.html { redirect_to @location, notice: 'Location details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end 
  end
    
  # Delete specific location
  def destroy
    @location.destroy
    respond_to do |format|
      format.html
      format.js
    end 
  end 

  private

  # private method to find location with its id
  def set_location
    @location = Location.find(params[:id])
  end

  # private method to pass parameters for adding and editing locations
  def location_params
    params.require(:location).permit(:name , :region_id)
  end

end