class DaysController < ApplicationController
  def index
  end

  def show
    @date = Date.parse(params[:id])
    @tasks = current_user.tasks.where(date: @date)
    @tasks = @tasks.order(:created_at)
  end
end
