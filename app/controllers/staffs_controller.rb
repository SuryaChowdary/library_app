class StaffsController < ApplicationController

  before_action :set_staff, only: [:show, :edit,:update, :destroy]

  def index 
    @staff = Staff.all
  end 

  def new 
    @staff = Staff.new
  end 

  def create 
    @staff=Staff.new(staff_params)
    if @staff.save
      flash[:notice] = "Staff details are added successfully"
      redirect_to  staffs_path(@staff)
    else 
      render 'new'
    end
  end

  def show

  end

  def edit
    
  end

  def update
    if @staff.update(staff_params)
      flash[:notice] = "Edited details Successfully"
      redirect_to  @staff
    else 
      render 'edit'
    end 
  end

  def destroy
    @staff.destroy
    redirect_to staffs_path
  end

  private

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:name ,:email ,:phonenumber, :gender , :age , :date_of_birth, :address)
  end
  
end
