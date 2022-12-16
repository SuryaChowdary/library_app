class BookroomsController < ApplicationController

  def show 
    @bookroom = Bookroom.find(params[:id])
  end


  def index 
    @bookroom = Bookroom.all
  end 
  
  def new 
    @bookroom = Bookroom.new
  end 
  
  def edit
    @bookroom = Bookroom.find(params[:id])
  end

  def create 
    @bookroom=Bookroom.new(params.require(:bookroom).permit(:name))
    if @bookroom.save
      flash[:notice] = "Library branch is added successfully"
    redirect_to  bookrooms_path(@bookroom)
    else render 'new'
    end
  end 

  def update
    @bookroom = Bookroom.find(params[:id])
    if @bookroom.update(params.require(:bookroom).permit(:name))
      flash[:notice] = "Libray Branch name Edited Successfully"
      redirect_to  bookrooms_path(@bookroom)
    else 
      render 'edit'
    end 
  
    end
    

    def destroy
      @bookroom = Bookroom.find(params[:id])
      @bookroom.destroy
      redirect_to bookrooms_path

    end 



end