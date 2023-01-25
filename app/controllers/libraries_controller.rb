class LibrariesController < ApplicationController
  
  before_action :set_library, only: [:show, :edit, :update, :destroy] 
  before_action :require_user

  def index
    @libraries = Library.all
  end

  def new
    @library = Library.new
  end 

  def create
    @library=Library.new(library_params)
    if @library.save
      respond_to do|format|
        format.html {redirect_to libraries_path}
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

  def destroy
    @library.destroy
    respond_to do |format|
      format.html
      format.js
    end 
  end

  private
  
  def set_library
    @library = Library.find(params[:id])
  end

  def library_params
    params.require(:library).permit(:name, :company_id)
  end

end
