require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  describe 'admin user' do
    before :each do
      login_with create(:user_admin)
    end
    it 'should see users list' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'normal user' do
    before :each do
      login_with create(:user)
    end
    it 'should not be authorised to see list of users' do
      get :index
      expect(response).to redirect_to(:root)
      expect(flash[:alert]).to eq 'Access Denied: need to be admin'
    end
  end
end

