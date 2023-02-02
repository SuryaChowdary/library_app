class StaffsController < ApplicationController

  before_action :set_staff, only: [:show, :edit,:update, :destroy]
  before_action :require_user

  # Display list of staffs
  def index 
    @staffs = Staff.all
  end 

  # Show staff details
  def show
  end

  # Add new staff
  def new 
    @staff = Staff.new
  end 

  # Save new Staff
  def create 
    @staff=Staff.new(staff_params)
    if @staff.save
      respond_to do|format|
        format.html {redirect_to staffs_path}
        format.js {redirect_to staffs_path, :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  # Edit specific staff
  def edit
    respond_to do |format|
      format.html
      format.js 
    end
  end

  # Update specific staff
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

  # Delete specific staff
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Employee was successfully deleted.' }
      format.js  
    end
  end

  private

  # private method to find staff with its id
  def set_staff
    @staff = Staff.find(params[:id])
  end

  # private method to pass staff parameters for adding and editing staff
  def staff_params
    params.require(:staff).permit(:name ,:email ,:phonenumber, :gender , :age , :date_of_birth, :address)
  end
  
end
