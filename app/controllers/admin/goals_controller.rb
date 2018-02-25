class Admin::GoalsController < Admin::ApplicationController
  before_action :authenticate_user!

  def new
    @goal = Goal.new
    @categories = Category.all
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      flash[:notice] = 'Goal created successfully'
      redirect_to admin_goals_path
    else
      flash[:alert] = 'Invalid goal'
      render 'new'
    end
  end

  def index
    @goals = Goal.all
  end

  def show
  end

  def edit
    @goal = Goal.find(params[:id])
    @categories = Category.all
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      flash[:notice] = 'Goal updated'
      redirect_to admin_goals_path
    else
      flash[:alert] = 'Could not update the goal'
      redirect_to edit_admin_goal_path(params[:id])
    end
  end

  def delete
  end

  private
  def goal_params
    params.require(:goal).permit(
        :name,
        :category_id,
        :end_target,
        :frequency,
        :goal_value,
        :new_entry_add_to_total
    )
  end
end

