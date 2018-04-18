module Admin
  class UsersController < Admin::ApplicationController
    before_action :authenticate_user!, :authorize_admin

    def index
      @users = User.all
    end

    def show; end

    def edit
      @user = find_or_redirect(:user, params[:id])
    end

    def update
      user = find_or_redirect(:user, params[:id])
      return if user.nil?
      if user.update(user_params)
        flash[:notice] = "User #{user.email} was successfully updated"
        redirect_to admin_users_path
      else
        flash[:alert] = "Could not update #{user.email}"
        redirect_to edit_admin_user_path(params[:id])
      end
    end

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

    private

    def user_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :role)
    end
  end
end
