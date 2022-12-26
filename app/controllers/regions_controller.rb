class RegionsController < ApplicationController
  
  def index
    @region = Region.all
  end

  def new
    @region = Region.new
  end 

  def create
    @region=Region.new(params.require(:region).permit(:name))
    if @region.save
      flash[:notice]="Region was added successfully"
      redirect_to regions_path(@region)
    else
      render 'new'
    end
  end

  def show
    @region = Region.find(params[:id])
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(params.require(:region).permit(:name))
    flash[:notice] = "Region was updated successfully"
      redirect_to @region
    else
      render 'edit'
    end
  end

  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    flash[:notice] = "Region was deleted Successfully"
    redirect_to regions_path 
  end

end
