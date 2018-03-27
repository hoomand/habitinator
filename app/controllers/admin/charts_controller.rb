class Admin::ChartsController < Admin::ApplicationController
  before_action :authenticate_user!

  def goal_logs
    goal = Goal.find(params[:id])
    render json: goal.ledgers.group_by_day(:created_at, range: goal.created_at..Time.now).count
  end


end
