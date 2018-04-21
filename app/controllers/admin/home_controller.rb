module Admin
  class HomeController < Admin::ApplicationController
    before_action :authenticate_user!

    def index
      @new_users_count = User.where("created_at >= ?", 1.month.ago.utc).count
      @new_categories_count = Category.where("created_at >= ?", 1.month.ago.utc).count
      @new_goals_count = Goal.where("created_at >= ?", 1.month.ago.utc).count
      @new_ledgers_count = Ledger.where("created_at >= ?", 1.month.ago.utc).count

      @defined_by = 'all users'
      if current_user.admin?
        @total_categories = Category.count
        @total_goals = Goal.count
        @total_ledgers = Ledger.count
      else
        @defined_by = 'you'
        @total_categories = current_user.categories.count
        @total_goals = current_user.goals.count
        @total_ledgers = current_user.ledgers.count
      end
    end
  end
end
