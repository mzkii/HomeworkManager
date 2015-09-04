class ProjectsController < ApplicationController
	before_action :set_project,only:[:show,:edit,:update,:destroy]

	def set_project
		@project = Project.find(params[:id])
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	def index
		@projects = Project.all
	end

	def show
	end

	def new
		@project = Project.new
	end

	def edit
	end
	
	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_path
		else
			render 'new'
		end
	end

	def update
		if @project.update(project_params)
			redirect_to projects_path
		else
			render 'edit'
		end

	end


	private



	def project_params

		#cation!!
		params[:project].permit(:title,:Professor_name,:Lecture_date,:Days,:Times)
	end

end
