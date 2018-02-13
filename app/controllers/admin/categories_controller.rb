class Admin::CategoriesController < Admin::ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to admin_categories_path
    else
      flash[:alert] = 'Invalid category'
      render 'new'
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def category_params
    params.require(:category).permit(:name, :unit_type, :unit_name)
  end
end
