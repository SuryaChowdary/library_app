class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit,:update, :destroy]
  before_action :require_user

  def index 
    @locations = Location.all
  end 

  def new 
    @location = Location.new
  end 

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
  
  def show 

  end
  
  def edit

  end

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
    
  def destroy
    @location.destroy
    respond_to do |format|
      format.html
      format.js
    end 
  end 

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name , :region_id)
  end

end