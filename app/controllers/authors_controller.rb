class AuthorsController < ApplicationController
  
  before_action :set_author, only: [:show, :edit,:update, :destroy]
  before_action :require_user

  def index 
    @author = Author.all
  end 

  def new 
    @author = Author.new
  end 

  def create 
    @author=Author.new(author_params)
    if @author.save
      flash[:notice] = "Author details are added successfully"
      redirect_to  authors_path(@author)
    else 
      render 'new'
    end
  end

  def show

  end

  def edit

  end 

  def update
    if @author.update(author_params)
      flash[:notice] = "Edited details Successfully"
      redirect_to  @author
    else 
      render 'edit'
    end 
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :gender , :age , :date_of_birth, :address , topic: [])
  end

end
