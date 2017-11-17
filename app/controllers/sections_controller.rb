class SectionsController < ApplicationController
  before_action :authenticate_instructor!, only:[:new, :create, :edit, :update]
  def index
    find_chapter
    @sections = @chapter.sections
  end
  def show
    find_section
  end

  def new
    find_chapter
    if @chapter.course.instructors.include?(current_user) || current_user.role == "super_admin"
    @section = Section.new
    else
      flash[:warning] = "You can't add a section to the course which is not yours!"
      redirect_to chapter_path(@chapter)
    end
  end

  def create
    find_chapter
    @section = @chapter.sections.build(section_params)
    if @section.save
      flash[:success] = "#{@section.title} sucessfully added to #{@chapter.title} chapter"
      redirect_to course_chapter_section_path(@section.chapter.course, @section.chapter,@section)
    else
      render :new
    end
  end

  private 
  def find_section
    @section = Section.find_by_id(params[:id])
  end

  def find_chapter
    @chapter = Chapter.find_by_id(params[:chapter_id])
  end

  def section_params
    params.require(:section).permit(:title, :content)
  end
end
