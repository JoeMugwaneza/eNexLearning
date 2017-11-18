class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @courses = Course.all
  end
end
