require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  describe 'admin user' do
    before :each do
      login_with create(:user_admin)
      @jane = create(:user_jane)
    end
    it 'should see users list' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'should be able to edit a user' do
      get :edit, params: { id: @jane.id }
      expect(response).to render_template(:edit)
    end
    it 'should be able to delete a user' do
      get :destroy, params: { id: @jane.id }
      expect(response).to redirect_to(:admin_users)
      expect(flash[:notice]).to eq "User #{@jane.email} was successfully deleted"
    end
  end

  describe 'normal user' do
    before :each do
      login_with create(:user)
      @jane = create(:user_jane)
      @message = 'Access Denied: need to be admin'
    end
    it 'should not be authorised to see list of users' do
      get :index
      expect(response).to redirect_to(:root)
      expect(flash[:alert]).to eq @message
    end
    it 'should not be authorized to edit a user' do
      get :edit, params: { id: @jane.id }
      expect(response).to redirect_to(:root)
      expect(flash[:alert]).to eq @message
    end
    it 'should not be authorized to delete a user' do
      get :destroy, params: { id: @jane.id }
      expect(response).to redirect_to(:root)
      expect(flash[:alert]).to eq @message
    end
  end
end

