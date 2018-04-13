module Admin
  class GoalsController < Admin::ApplicationController
    before_action :authenticate_user!

    def new
      @goal = Goal.new
      @categories = current_user.categories
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
      @goals = current_user.goals
    end

    def show
      @goal = find_or_redirect(:goal, params[:id])
    end

    def edit
      @goal = find_or_redirect(:goal, params[:id])
      @categories = current_user.categories
    end

    def update
      @goal = find_or_redirect(:goal, params[:id])
      return if @goal.nil?
      if @goal.update(goal_params)
        flash[:notice] = 'Goal updated'
        redirect_to admin_goals_path
      else
        flash[:alert] = 'Could not update the goal'
        redirect_to edit_admin_goal_path(params[:id])
      end
    end

    def destroy
      @goal = find_or_redirect(:goal, params[:id])
      @goal.delete

      flash[:notice] = "Goal #{@goal.name} was successfully deleted"
      redirect_to admin_goals_path
    end

    private

    def goal_params
      params.require(:goal).permit(:name,
                                   :category_id,
                                   :end_target,
                                   :frequency,
                                   :goal_value,
                                   :new_entry_add_to_total)
    end
  end
end
