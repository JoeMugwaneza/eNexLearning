class SearchesController < ApplicationController
  def index
    
  end
  def search
  @results = Subject.search(params[:query]) + Course.search(params[:query]) + Chapter.search(params[:query]) +Section.search(params[:query])
  render :index
  end
end
