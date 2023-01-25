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
      flash[:notice] = "Library branch is added successfully"
      redirect_to  companies_path(@company)
    else 
      render 'new'
    end
  end 

  def show 
    @book = Book.all
  end

  def edit

  end

  def update
    if @company.update(company_params)
      flash[:notice] = "Libray Branch name Edited Successfully"
      redirect_to  companies_path(@company)
    else 
      render 'edit'
    end 
  end

  def destroy
    @company.destroy
    redirect_to companies_path
  end
  
  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name , location_ids: [])
  end
end