class AuthorsController < ApplicationController
  
  def show
    @author = Author.find(params[:id])
  end

  def index 
    @author = Author.all
  end 

  def new 
    @author = Author.new
  end 

  def edit
    @author = Author.find(params[:id])
  end

  def create 
    @author=Author.new(params.require(:author).permit(:name, :gender , :age , :date_of_birth, :address))
    if @author.save
      flash[:notice] = "Author details are added successfully"
      redirect_to  authors_path(@author)
    else 
      render 'new'
     
    end

  end 

  def update
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:name, :gender , :age , :date_of_birth, :address))
      flash[:notice] = "Edited details Successfully"
      redirect_to  @author
    else 
      render 'edit'
    end 
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path

  end
  
end
