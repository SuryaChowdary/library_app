class BooksController < ApplicationController
  def show 
    @book = Library.find(params[:id])
  end
  def index 
    @books = Library.all
  end 
  def edit 
  end 
end 