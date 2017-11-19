class Api::V1::SectionsApisController < ApplicationController
	def index
		@sections = Section.all
	end
	def show
		find_section
	end

	private
	def find_section
		@section = Section.find_by(id: params[:id])
	end
end
