class StaffsController < ApplicationController

  before_action :set_staff, only: [:show, :edit,:update, :destroy]
  before_action :require_user

  def index 
    @staffs = Staff.all
  end 

  def new 
    @staff = Staff.new
  end 

  def create 
    @staff=Staff.new(staff_params)
    if @staff.save
      respond_to do|format|
        format.html {redirect_to staffs_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  def show

  end

  def edit
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def update
    if @staff.update(staff_params)
      respond_to do |format|
        format.html { redirect_to @staff, notice: 'Employee details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end 
  end

  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Employee was successfully deleted.' }
      format.js  
    end
  end

  private

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:name ,:email ,:phonenumber, :gender , :age , :date_of_birth, :address)
  end
  
end
