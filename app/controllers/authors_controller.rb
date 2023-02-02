class AuthorsController < ApplicationController
  
  before_action :set_author, only: [:show, :edit,:update, :destroy]
  before_action :require_user

  # Display list of all authors
  def index 
    @authors = Author.all
  end 

  # Show specific author details
  def show
  end

  # Add new Author
  def new 
    @author = Author.new
  end 

  # Save new Author
  def create 
    @author=Author.new(author_params)
    if @author.save
      respond_to do|format|
        format.html {redirect_to authors_path}
        format.js {redirect_to authors_path, :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  # Edit specific author
  def edit
  end 

  # Update specific author details
  def update
    if @author.update(author_params)
      respond_to do |format|
        format.html { redirect_to @author, notice: 'Author details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end 
  end

  # Delete specific author
  def destroy
    @author.destroy
    respond_to do|format|
      format.html
      format.js
    end
  end

  private

  # private method to find author with their id
  def set_author
    @author = Author.find(params[:id])
  end

  # private method to pass parameters to add and edit author details
  def author_params
    params.require(:author).permit(:name, :gender , :age , :date_of_birth, :address , topic: [])
  end

end
