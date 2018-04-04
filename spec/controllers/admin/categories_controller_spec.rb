require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "should be redirected to signin" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "logged in user" do
    before :each do
      login_with create(:user)
    end
    it "should see all his categoriess" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "two different logged in users" do
    before :each do
      @user_a = create(:user)
      @user_b = create(:user_jane)
    end
    it "should not be able to list each other's categories" do
      login_with @user_a
      category_book = create(:category_book, user: @user_a)
      get :index
      expect(assigns(:categories)).to eq([category_book])

      login_with @user_b
      get :index
      expect(assigns(:categories)).to eq([])
    end

    it "should not be able to get the edit form of each other's categories" do
      login_with @user_a
      category_book = create(:category_book, user: @user_a)
      get :edit, params: {id: category_book}
      expect(response.status).to eq(200)

      login_with @user_b
      get :edit, params: {id: category_book}
      expect(response).to redirect_to(admin_categories_path)
      expect(flash[:alert]).to eq 'Specified category does not exist'
    end

    it "should not be able to update each other's categories" do
      login_with @user_a
      category_book = create(:category_book, user: @user_a)
      attr = {
          name: 'new category name'
      }
      put :update, params: {id: category_book, category: attr}
      expect(response).to redirect_to(admin_categories_path)
      expect(flash[:notice]).to eq 'Category updated'

      login_with @user_b
      put :update, params: {id: category_book, category: attr}
      expect(response).to redirect_to(admin_categories_path)
      expect(flash[:alert]).to eq 'Specified category does not exist'
    end
  end
end
