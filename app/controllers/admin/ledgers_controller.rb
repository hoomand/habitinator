class Admin::LedgersController < Admin::ApplicationController
  before_action :authenticate_user!

  def new
    raise 'Goal must be provided' unless params.key?('goal')
    goal = Goal.find(params[:goal])
    @ledger = Ledger.new(goal: goal)
  end

  def create
    @ledger = Ledger.new(ledger_params)
    if @ledger.save
      flash[:notice] = "Progress for #{@ledger.goal.name} was saved successfully, good job!"
    else
      flash[:alert] = "Could not save your progress for #{@ledger.goal.name}"
    end

    redirect_to admin_goals_path
  end

  private
  def ledger_params
    params.require(:ledger).permit(
        :goal_id,
        :value
    )
  end
end
