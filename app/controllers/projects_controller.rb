class ProjectsController < ApplicationController

	before_action :find_project, only: [:show, :edit, :update, :destroy]

	def index
		if user_signed_in?
			@projects = Project.where(:user_id => current_user.id).order("created_at DESC")
		end
	end

	def new
		@project = current_user.projects.build
	end

	def create
		@project = current_user.projects.build(project_params)
		if @project.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update 
		if @project.update(project_params)
			redirect_to project_path(@project)
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to root_path
	end

	def complete
		@project = Project.find(params[:id])
		@project.update_attribute(:completed_at, Time.now)
		redirect_to root_path
	end

	def show
		
	end

	def project_params
		params.require(:project).permit(:title, :author)
	end

	def find_project
		@project = Project.find(params[:id])
	end


end
