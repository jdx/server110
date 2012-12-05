class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.user = current_user
    if @task.save
      redirect_to day_path(Time.zone.today)
    else
      render :new
    end
  end

  def review
    @task = current_user.tasks.where(date: Time.zone.today).find(params[:id])
    @task.reviewed = params[:reviewed]
    @task.save!

    render nothing: true
  end
end
