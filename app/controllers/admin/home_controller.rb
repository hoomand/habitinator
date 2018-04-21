module Admin
  class HomeController < Admin::ApplicationController
    before_action :authenticate_user!
    def index
      @new_users_count = User.where("created_at >= ?", 1.month.ago.utc).count
      @new_categories_count = Category.where("created_at >= ?", 1.month.ago.utc).count
      @new_goals_count = Goal.where("created_at >= ?", 1.month.ago.utc).count
      @new_ledgers_count = Ledger.where("created_at >= ?", 1.month.ago.utc).count

      @total_categories = Category.count
      @total_goals = Goal.count
      @total_ledgers = Ledger.count
    end
  end
end
