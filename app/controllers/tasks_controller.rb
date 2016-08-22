class TasksController < ApplicationController
	before_action :find_task, only: [:show, :edit, :update, :destroy]

	def create
		@task = current_user.projects.tasks.build(task_params)
		@task.save
		redirect_to projects_path
	end

	def show
	end

	def edit
	end

	def update

	end

	def destroy
		
	end



	def find_task
		@task = find_project.tasks.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:title, :user_id)
	end


end
