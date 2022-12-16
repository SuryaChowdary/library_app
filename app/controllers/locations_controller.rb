class LocationsController < ApplicationController

  def show 
    @location = Location.find(params[:id])
  end


  def index 
    @location = Location.all
  end 
  
  def new 
    @location = Location.new
  end 
  
  def edit
    @location = Location.find(params[:id])
  end

  def create 
    @location=Location.new(params.require(:location).permit(:place))
    if @location.save
      flash[:notice] = "location is added successfully"
    redirect_to  locations_path(@location)
    else render 'new'
    end
  end 

  def update
    @location = Location.find(params[:id])
    if @location.update(params.require(:location).permit(:place))
      flash[:notice] = " Location name Edited Successfully"
      redirect_to  locations_path(@location)
    else 
      render 'edit'
    end 
  
    end
    

    def destroy
      @location = Location.find(params[:id])
      @location.destroy
      redirect_to locations_path

    end 



end