class SubjectsController < ApplicationController
  before_action :authenticate_superadmin!, only:[:new, :create, :edit, :update]
  def index
    @subjects = Subject.all
    @threeSubjects = Subject.all.order("created_at ASC").limit(4)
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
