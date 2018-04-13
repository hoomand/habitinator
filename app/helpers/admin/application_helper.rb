module Admin
  module ApplicationHelper
    def active_controller?(controller)
      'active' if params[:controller] == controller
    end
  end
end
