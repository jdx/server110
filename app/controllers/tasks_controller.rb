class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.user = current_user
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end
end
