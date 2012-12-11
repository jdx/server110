module Api
  class DaysController < BaseController
    def index
      start_date = 2.weeks.ago.to_date
      start_date = start_date - start_date.wday.days
      end_date = Time.zone.now.to_date

      @days = []
      (start_date..end_date).each do |d|
        @days << {
          date: d,
          tasks: current_user.tasks.where(date: d),
        }
      end

      render json: @days, content_type: 'application/json'
    end
  end
end
