module Admin::ApplicationHelper
  def active_controller?(controller)
    if params[:controller] == controller
      'active'
    end
  end
end