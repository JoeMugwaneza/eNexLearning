class SearchesController < ApplicationController
  
  def index
     
  end
  def search
   @results = Course.search(params[:query]) + Chapter.search(params[:query]) +Section.search(params[:query])
   render :index
   @subjects = Subject.search(params[:query])
  end

end
