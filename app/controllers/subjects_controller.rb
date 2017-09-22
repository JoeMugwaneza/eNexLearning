class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def show
    find_subject
    @courses = @subject.courses
  end

  def new
   @subject = Subject.new 
  end
  def create
   @subject = Subject.new(subject_params) 
    if @subject.save
      flash[:success]= "#{@subject.title} sucessfully created as a courses subject!"
      redirect_to subjects_path
    else
      render :new
    end
  end
  private 
  def find_subject
    @subject = Subject.find_by_id(params[:id])
  end
  def subject_params
   params.require(:subject).permit(:title, :description, :image) 
  end
end
