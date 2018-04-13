module Admin
  class CategoriesController < Admin::ApplicationController
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
      @categories = current_user.categories
    end

    def show; end

    def edit
      @category = find_or_redirect(:category, params[:id])
    end

    def update
      @category = find_or_redirect(:category, params[:id])
      return if @category.nil?
      @category.update(category_params)

      flash[:notice] = 'Category updated'
      redirect_to admin_categories_path
    end

    def destroy
      @category = find_or_redirect(:category, params[:id])

      @category.destroy
      flash[:notice] = "Category #{@category.name} was deleted successfully"
      redirect_to admin_categories_path
    end

    private

    def category_params
      params.require(:category).permit(:name, :unit_type, :unit_name)
    end
  end
end
