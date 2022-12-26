class LibrariesController < ApplicationController
  
  def index
    @library = Library.all
  end

  def new
    @library = Library.new
  end 

  def create
    @library=Library.new(params.require(:library).permit(:name))
    if @library.save
      flash[:notice]="Library was added successfully"
      redirect_to libraries_path(@library)
    else
      render 'new'
    end
  end

  def show
    @library = Library.find(params[:id])
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    @library = Library.find(params[:id])
    if @library.update(params.require(:library).permit(:name))
    flash[:notice] = "Library was updated successfully"
      redirect_to @library
    else
      render 'edit'
    end
  end

  def destroy
    @library = Library.find(params[:id])
    @library.destroy
    flash[:notice] = "Library was deleted Successfully"
    redirect_to libraries_path 
  end

end
