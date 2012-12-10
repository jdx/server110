module Api
  class TasksController < BaseController
    def index
      @tasks = current_user.tasks

      respond_with @tasks
    end
  end
end
