require 'rails_helper'

RSpec.describe Admin::GoalsController, type: :controller do
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
    it "should see all his goals" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "two different logged in users" do
    before :each do
      @user_a = create(:user)
      @user_b = create(:user_jane)
      category_book_user_a = create(:category_book, user: @user_a)
      @read_book = create(:read_Ready_Player_One_book, category: category_book_user_a)
    end
    it "should not be able to list each other's goals" do
      login_with @user_a
      get :index
      expect(assigns(:goals)).to eq([@read_book])

      login_with @user_b
      get :index
      expect(assigns(:goals)).to eq([])
    end

    it "should not be able to get the edit form of each other's goals" do
      login_with @user_a
      get :edit, params: {id: @read_book}
      expect(response.status).to eq(200)

      login_with @user_b
      get :edit, params: {id: @read_book}
      expect(response).to redirect_to(admin_goals_path)
      expect(flash[:alert]).to eq 'Specified goal does not exist'
    end

    it "should not be able to update each other's goals" do
      login_with @user_a
      attr = {
          name: 'new goal name'
      }
      put :update, params: {id: @read_book, goal: attr}
      expect(response).to redirect_to(admin_goals_path)
      expect(flash[:notice]).to eq 'Goal updated'

      login_with @user_b
      put :update, params: {id: @read_book, goal: attr}
      expect(response).to redirect_to(admin_goals_path)
      expect(flash[:alert]).to eq 'Specified goal does not exist'
    end
  end
end
