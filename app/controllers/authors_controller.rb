class AuthorsController < ApplicationController
  
  before_action :set_author, only: [:show, :edit,:update, :destroy]
  before_action :require_user

  def index 
    @authors = Author.all
  end 

  def new 
    @author = Author.new
  end 

  def create 
    @author=Author.new(author_params)
    if @author.save
      respond_to do|format|
        format.html {redirect_to authors_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  def show

  end

  def edit

  end 

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

  def destroy
    @author.destroy
    respond_to do|format|
      format.html
      format.js
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :gender , :age , :date_of_birth, :address , topic: [])
  end

end
