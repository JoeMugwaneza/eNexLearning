class SectionsController < ApplicationController
  def show
    find_section
  end

  def new
    @section = Section.new
  end

  def create
    find_chapter
    @section = @chapter.sections.build(section_params)
    if @section.save
      flash[:success] = "#{@section.title} sucessfully added to #{@chapter.title} chapter"
      redirect_to section_path(@section)
    else
      render :new
    end
  end

  private 
  def find_section
    @section = Section.find_by_id(params[:id])
  end

  def find_chapter
    @chapter = Chapter.find_by_id(params[:id])
  end

  def section_params
    params.require(:section).permit(:title, :content)
  end
end
