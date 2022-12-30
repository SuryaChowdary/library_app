class BooksController < ApplicationController

  before_action :set_book , only: [:show, :edit,:update, :destroy]
  before_action :require_user

  def index 
    @book = Book.all
    @authors = Author.all
  end 
  
  def new 
    @book = Book.new(skip_author: true)
  end 

  def create 
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book is added successfully"
    redirect_to  books_path(@book)
    else 
      render 'new'
    end
  end 

  def show 

  end
  
  def edit

  end

  def update
    if @book.update(book_params)
      flash[:notice] = "Edited Successfully"
      redirect_to  books_path(@book)
    else 
      render 'edit'
    end 
  end
    
  def destroy
    @book.destroy
    redirect_to books_path
  end 

  private

  def set_book 
    @book = Book.find(params[:id])
  end 

  def book_params
    params.require(:book).permit(:title, :pages , :date_of_publication, :summary , :rent , :author_id)
  end

end 