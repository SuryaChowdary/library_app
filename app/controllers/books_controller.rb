class BooksController < ApplicationController

  before_action :set_book , only: [:show, :edit,:update, :destroy]
  before_action :require_user

  # Display List of all books
  def index 
    @books = Book.all
    @authors = Author.all
  end 
  
  # Details of specific book
  def show 
  end
  
  # Add new book
  def new 
    @book = Book.new(skip_author: true)
  end 

  # Save new book
  def create 
    @book = Book.new(book_params)
    if @book.save
      respond_to do|format|
        format.html {redirect_to books_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end 

  # Edit specific book
  def edit
  end

  # Update specific book details
  def update
    if @book.update(book_params)
      respond_to do |format|
        format.html { redirect_to @book, notice: 'Book details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end 
  end
    
  # Delete specific book details
  def destroy
    @book.destroy
    respond_to do |format|
      format.html
      format.js 
    end
  end 

  private

  # private method to find book using id
  def set_book 
    @book = Book.find(params[:id])
  end 

  # private method to pass parameters for adding and editing books
  def book_params
    params.require(:book).permit(:title, :pages , :date_of_publication, :summary , :rent , :author_id)
  end

end 