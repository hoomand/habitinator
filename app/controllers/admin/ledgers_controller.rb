class Admin::LedgersController < Admin::ApplicationController
  before_action :authenticate_user!

  def new
    raise 'Goal must be provided' unless params.key?('goal')
    goal = find_or_redirect(:goal, params[:goal])
    return nil if goal.nil?
    today_ledger = find_today_ledger(goal.id) unless goal.nil?
    @ledger = today_ledger.empty? ? Ledger.new(goal: goal) : today_ledger.first
  end

  def create
    ledger = Ledger.new(ledger_params)
    if ledger.save
      flash[:notice] = "Progress for #{ledger.goal.name} was saved successfully"
    else
      flash[:alert] = "Could not save progress for #{ledger.goal.name}"
    end
    redirect_to admin_goals_path
  end

  def update
    ledger = find_or_redirect(:ledger, params[:id])
    ledger.update(ledger_params)

    flash[:notice] = "Progress updated for #{ledger.goal.name}"
    redirect_to admin_goals_path
  end

  private

  def ledger_params
    params.require(:ledger).permit(
        :goal_id,
        :value
    )
  end

  def find_today_ledger(goal_id)
    Ledger.where(
        'goal_id = ? AND created_at >= ?',
        goal_id,
        Time.zone.now.beginning_of_day
    )
  end
end
