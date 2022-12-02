class BooksController < ApplicationController
  def show 
    @book = Library.find(params[:id])
  end
end 