class BooksController < ApplicationController


  def show 
    @book = Library.find(params[:id])
  end


  def index 
    @book = Library.all
  end 
  
  def new 
    @book = Library.new
  end 
  
  def edit
    @book = Library.find(params[:id])
  end

  def create 
    @book=Library.new(params.require(:book).permit(:title , :author_id ,:pages , :date_of_publication, :summary , :rent))
    @book.author = Author.first
    if @book.save
      flash[:notice] = "Book is added successfully"
    redirect_to  books_path(@book)
    else render 'new'
    end
  end 

  def update
    @book = Library.find(params[:id])
    if @book.update(params.require(:book).permit(:title ,:author ,:pages , :date_of_publication, :summary , :rent))
      flash[:notice] = "Edited Successfully"
      redirect_to  books_path(@book)
    else 
      render 'edit'
    end 
  
    end
    

    def destroy
      @book = Library.find(params[:id])
      @book.destroy
      redirect_to books_path

    end 

end 