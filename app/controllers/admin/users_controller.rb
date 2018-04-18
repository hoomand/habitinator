module Admin
  class UsersController < Admin::ApplicationController
    before_action :authenticate_user!, :authorize_admin

    def index
      @users = User.all
    end

    def show; end

    def edit; end

    def update; end

    def destroy
      user = find_or_redirect(:user, params[:id])
      if user.admin?
        flash[:alert] = "User #{user.email} is an admin and cannot be deleted"
      else
        user.delete
        flash[:notice] = "User #{user.email} was successfully deleted"
      end
      redirect_to admin_users_path
    end
  end
end
