class ChaptersController < ApplicationController
  def index
    
  end

  def show
    find_chapter
    @sections = @chapter.sections
  end
  def new
   @chapter = Chapter.new 
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
