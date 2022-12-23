class PagesController < ApplicationController
  def home

  end

  def about

  end 

  def location
    @company = Company.all

  end

end
