module Admin
  class UsersController < Admin::ApplicationController
    before_action :authenticate_user!, :authorize_admin

    def index; end

    def show; end

    def edit; end

    def update; end

    def delete; end
  end
end
