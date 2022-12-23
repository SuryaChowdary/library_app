class BooksController < ApplicationController


  def show 
    @book = Book.find(params[:id])
  end

  def index 
    @book = Book.all
    @authors = Author.all
  end 
  
  def new 
    @book = Book.new
  end 
  
  def edit
    @book = Book.find(params[:id])
  end

  def create 
    @book=Book.new(book_params)
    if @book.save
      flash[:notice] = "Book is added successfully"
    redirect_to  books_path(@book)
    else render 'new'
    end
  end 

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Edited Successfully"
      redirect_to  books_path(@book)
    else 
      render 'edit'
    end 
  
    end
    

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path

    end 

    private

    def book_params
      params.require(:book).permit(:title, :pages , :date_of_publication, :summary , :rent , :author_id)
    end

end 