class RegionsController < ApplicationController
  
  before_action :set_region, only: [:show, :edit, :update, :destroy]
  before_action :require_user

  # Display list of all regions
  def index
    @regions = Region.all
  end

  # Add new Region
  def new
    @region = Region.new
  end 

  # Save new Region
  def create
    @region=Region.new(region_params)
    if @region.save
      respond_to do|format|
        format.html {redirect_to regions_path}
        format.js {redirect_to regions_path, :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  # Show specific region details
  def show
  end

  # Edit specific region details
  def edit
  end

  # Update specific region details
  def update
    if @region.update(region_params)
      respond_to do |format|
        format.html { redirect_to @region, notice: 'Region details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end
  end

  # Delete specific region
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region details was successfully deleted.' }
      format.js  
    end
  end

  private
  
  # private method to find region with its id
  def set_region
    @region = Region.find(params[:id])
  end

  #private method to pass parameters for adding and updating regions
  def region_params
    params.require(:region).permit(:name)
  end

end
