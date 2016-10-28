class ProjectsController < ApplicationController
	def new
		@project=Project.new
	end
	def create
		@project=Project.new(user_params)
		
	end
	def index
		@projects=Project.all
	end
	def show
		@project=Project.find_by_id(params[:id])
	end
	private
	def user_params
		params.require(:project).permit(:name,:duration,:teamsize,:cost,:domain)
	end
end
