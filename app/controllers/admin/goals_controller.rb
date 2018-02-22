class Admin::GoalsController < Admin::ApplicationController
  before_action :authenticate_user!
  def index
    @goals = Goal.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
