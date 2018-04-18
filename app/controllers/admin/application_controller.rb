module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    layout 'admin/application'

    def find_or_redirect(object_type, id)
      obj = nil
      return_path = ''

      case object_type
      when :goal
        obj = current_user.goals.find_by id: id
        return_path = admin_goals_path
      when :category
        obj = current_user.categories.find_by id: id
        return_path = admin_categories_path
      when :ledger
        ledger = Ledger.find(id)
        obj = ledger unless ledger.nil? || ledger.goal.category.user_id != current_user.id
        return_path = admin_goals_path
      when :user
        obj = User.find_by id: id
        return_path = admin_users_path
      end

      return obj unless obj.nil?

      flash[:alert] = "Specified #{object_type} does not exist"
      redirect_to return_path
      obj
    end

    def authorize_admin
      redirect_to root_path, alert: 'Access Denied: need to be admin' unless current_user.admin?
    end
  end
end
