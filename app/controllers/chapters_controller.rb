class ChaptersController < ApplicationController
  before_action :authenticate_instructor!, only:[:new, :create, :edit, :update]
  def index
    
  end

  def show
    find_chapter
    @sections = @chapter.sections
  end
  def new
    find_course
    if @course.instructors.include?(current_user)
     @chapter = Chapter.new 
    else
      flash[:warning] = "You can't add a new chapter to the course which is not yours"
      redirect_to course_path(@course)
    end
  end
  def create
    find_course
    @chapter = @course.chapters.build(chapter_params)
    if @chapter.save
      flash[:success] = "#{@chapter.title} successfully added to #{@chapter.course.title}"
      redirect_to chapter_path(@chapter)
    else
      render :new
    end
  end
  private
  def find_chapter
    @chapter = Chapter.find_by_id(params[:id])
  end
  def find_course
    @course = Course.find_by_id(params[:id])
  end
  def chapter_params
    params.require(:chapter).permit(:title, :tags, :body)
  end
end
