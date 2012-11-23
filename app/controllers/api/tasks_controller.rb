module Api
  class TasksController < BaseController
    def index
      @tasks = current_user.tasks
    end
  end
end
