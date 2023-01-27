class CompaniesController < ApplicationController

  before_action :set_company , only: [:show, :edit,:update, :destroy]
  before_action :require_user 

  def index 
    @companies = Company.all
  end 
  
  def new 
    @company = Company.new
  end 
  
  def create 
    @company = Company.new(company_params)
    if @company.save
      respond_to do|format|
        format.html {redirect_to companies_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end 

  def show 
    @book = Book.all
  end

  def edit

  end

  def update
    if @company.update(company_params)
      respond_to do |format|
        format.html { redirect_to @company, notice: 'Company details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end 
  end

  def destroy
    @company.destroy
    respond_to do|format|
      format.html
      format.js
    end
  end

  def locations_by_region
    @locations = Location.where(region_id: params[:regions])
    respond_to do |format|
      format.js { render :locations_by_region }
    end
  end
  
  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name , region_ids: [],  location_ids: [])
  end
end