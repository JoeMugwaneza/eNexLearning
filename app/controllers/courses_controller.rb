class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  def show
    find_course
    @chapters = @course.chapters
  end

  def new
    @course = Course.new
  end

  def create
    find_subject
    @course = @subject.courses.build(course_params)
    if @course.save
      flash[:success] ="#{@course.title} sucessfully created under #{@course.subject.title} subject"
      redirect_to course_path(@course)
    else
      render :new
    end
  end
  def edit
    find_course
  end
  def update
    find_course
    if  @course.update(course_params)
      flash[:success] ="#{@course.title} sucessfully updated"
      redirect_to course_path(@course)
    else
      render :edit
    end
  end
  private 
  def find_course
    @course = Course.find_by_id(params[:id])
  end
  def find_subject
    @subject = Subject.find_by_id(params[:id])
  end
  def course_params
    params.require(:course).permit(:title, :instructor_id, :about)
  end
end