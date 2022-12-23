class CompaniesController < ApplicationController

  def show 
    @company = Company.find(params[:id])
    @book = Book.all
  end


  def index 
    @company = Company.all
  end 
  
  def new 
    @company = Company.new
  end 
  
  def edit
    @company = Company.find(params[:id])
  end

  def create 
    @company=Company.new(params.require(:company).permit(:name , location_ids: []))
    if @company.save
      flash[:notice] = "Library branch is added successfully"
    redirect_to  companies_path(@company)
    else render 'new'
    end
  end 

  def update
    @company = Company.find(params[:id])
    if @company.update(params.require(:company).permit(:name , location_ids: []))
      flash[:notice] = "Libray Branch name Edited Successfully"
      redirect_to  companies_path(@company)
    else 
      render 'edit'
    end 
  
    end
    

    def destroy
      @company = Company.find(params[:id])
      @company.destroy
      redirect_to companies_path

    end 



end