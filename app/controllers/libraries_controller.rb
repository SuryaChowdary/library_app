class LibrariesController < ApplicationController
  
  before_action :set_library, only: [:show, :edit, :update, :destroy] 
  before_action :require_user

  # Display list of all libraries
  def index
    @libraries = Library.all
  end

  # Show specific library details
  def show
  end

  # Add new Library
  def new
    @library = Library.new
  end 

  # Save new Library
  def create
    @library=Library.new(library_params)
    if @library.save
      respond_to do|format|
        format.html {redirect_to libraries_path}
        format.js {redirect_to libraries_path, :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  # Edit specific library 
  def edit
  end

  # Update specific library details
  def update
    if @library.update(library_params)
      respond_to do |format|
        format.html { redirect_to @library, notice: 'Library details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end 
  end

  # Delete specific library
  def destroy
    @library.destroy
    respond_to do |format|
      format.html
      format.js
    end 
  end

  private
  
  # private method to find library with its id
  def set_library
    @library = Library.find(params[:id])
  end

  # private method to pass parameters for adding and editing company
  def library_params
    params.require(:library).permit(:name, :company_id)
  end

end
