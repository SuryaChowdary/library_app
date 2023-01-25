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
      flash[:notice]="Library was added successfully"
      redirect_to libraries_path(@library)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @library.update(library_params)
    flash[:notice] = "Library was updated successfully"
      redirect_to @library
    else
      render 'edit'
    end
  end

  def destroy
    @library.destroy
    flash[:notice] = "Library was deleted Successfully"
    redirect_to libraries_path 
  end

  private
  
  def set_library
    @library = Library.find(params[:id])
  end

  def library_params
    params.require(:library).permit(:name, :company_id)
  end

end
