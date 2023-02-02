class CompaniesController < ApplicationController

  before_action :set_company , only: [:show, :edit,:update, :destroy]
  before_action :require_user 

  # Display List of all companies
  def index 
    @companies = Company.all
  end 
  
  # Details of specific company
  def show 
    @book = Book.all
  end

  # Add new Company
  def new 
    @company = Company.new
  end 
  
  # Save new Company
  def create 
    @company = Company.new(company_params)
    if @company.save
      respond_to do|format|
        format.html {redirect_to companies_path}
        format.js {redirect_to companies_path, :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end 

  # Edit specific company
  def edit
  end

  # Update specific company
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

  # Delete specific company
  def destroy
    @company.destroy
    respond_to do|format|
      format.html
      format.js
    end
  end

  # Fetch locations for selected regions
  def locations_by_region
    @locations = Location.where(region_id: params[:regions])
    respond_to do |format|
      format.js { render :locations_by_region }
    end
  end
  
  private

  # private method to find company with its id
  def set_company
    @company = Company.find(params[:id])
  end

  # private method to pass parameters for adding and editing company details
  def company_params
    params.require(:company).permit(:name , region_ids: [],  location_ids: [])
  end
end