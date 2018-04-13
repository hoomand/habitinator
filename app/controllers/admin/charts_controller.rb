module Admin
  class ChartsController < Admin::ApplicationController
    before_action :authenticate_user!

    def goal_logs
      goal = Goal.find(params[:id])
      time = params[:start_date].nil? ? Time.now : params[:start_date].to_time
      creation_time_range = time.beginning_of_month..time.end_of_month
      case params[:type]
      when 'daily_logged_yes_no'
        render json: goal.ledgers.group_by_day(:created_at, range: creation_time_range).count
      when 'raising'
        render json: raising_data_points(goal)
      end
    end

    private

    def raising_data_points(goal)
      data_points = goal.ledgers.group_by_day(:created_at).sum(:value)
      graph = {}
      most_recent_positive_value = 0
      data_points.each do |date, value|
        if value > 0
          if goal.new_entry_add_to_total?
            most_recent_positive_value += value
          else
            most_recent_positive_value = value
          end
        end
        graph[date] = most_recent_positive_value
      end
      graph
    end
  end
end
