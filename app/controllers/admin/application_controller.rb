class Admin::ApplicationController < ActionController::Base
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
    end

    return obj unless obj.nil?

    flash[:alert] = "Specified #{object_type} does not exist"
    redirect_to return_path
  end

end
