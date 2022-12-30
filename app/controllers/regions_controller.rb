class RegionsController < ApplicationController
  
  before_action :set_region, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  def index
    @region = Region.all
  end

  def new
    @region = Region.new
  end 

  def create
    @region=Region.new(region_params)
    if @region.save
      flash[:notice]="Region was added successfully"
      redirect_to regions_path(@region)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(region_params)
    flash[:notice] = "Region was updated successfully"
      redirect_to @region
    else
      render 'edit'
    end
  end

  def destroy
    @region.destroy
    flash[:notice] = "Region was deleted Successfully"
    redirect_to regions_path 
  end

  private
  
  def set_region
    @region = Region.find(params[:id])
  end

  def region_params
    params.require(:region).permit(:name)
  end

end
