class BooksController < ApplicationController


  def show 
    @book = Library.find(params[:id])
  end


  def index 
    @books = Library.all
  end 
  
  def new 
    @book = Library.new
  end 


  def create 
    @book=Library.new(params.require(:book).permit(:title ,:author ,:pages , :date_of_publication, :summary , :rent))
    if @book.save
      flash[:notice] = "Book is added successfully"
    render plain: @book.inspect
    else render 'new'
    end
  end 
end 