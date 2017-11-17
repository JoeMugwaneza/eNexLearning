class CourseRegistrationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @registrations = current_user.course_registrations
  end
  def new
    if params[:course_id]
      @course = Course.find_by_id(params[:course_id])
      @courseRegistration = current_user.course_registrations.build(lesson_id: params[:course_id])
      if !@course.learners.include?(current_user) && @courseRegistration.save
        flash[:success] = "You have been enrolled in #{@courseRegistration.lesson.title}"
        redirect_to course_path(@courseRegistration.lesson)
      else
        flash[:warning] = "Sorry, your registration failed, try again!"
        redirect_to :back
      end
    end
  end
  def create
    
  end
end
