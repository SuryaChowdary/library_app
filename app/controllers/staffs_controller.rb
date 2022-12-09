class StaffsController < ApplicationController
  
  def show
    @staff = Staff.find(params[:id])
  end

  def index 
    @staff = Staff.all
  end 

  def new 
    @staff = Staff.new
  end 

  def edit
    @staff = Staff.find(params[:id])
  end

  def create 
    @staff=Staff.new(params.require(:staff).permit(:name ,:email ,:phonenumber, :gender , :age , :date_of_birth, :address))
    
    if @staff.save
      flash[:notice] = "Staff details are added successfully"
      redirect_to  staffs_path(@staff)
    else 
      render 'new'
     
    end

  end 

  def update
    @staff = Staff.find(params[:id])
    if @staff.update(params.require(:staff).permit(:name ,:email ,:phonenumber, :gender , :age , :date_of_birth, :address))
      flash[:notice] = "Edited details Successfully"
      redirect_to  @staff
    else 
      render 'edit'
    end 
  end

  
end
