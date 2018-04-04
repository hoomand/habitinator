require 'rails_helper'

RSpec.describe Admin::ChartsController, type: :controller do
  describe 'routing' do
    it 'routes /admin/charts/:type/goal/:id/logs' do
      expect(get: '/admin/charts/raising/goal/6/logs').to route_to(
                                                              controller: 'admin/charts',
                                                              action: 'goal_logs',
                                                              type: 'raising',
                                                              id: '6'
                                                          )
    end
  end
  describe 'chart for numeric goal' do
    before :each do
      @user = create(:user)
      login_with @user
      category_book = create(:category_book, user: @user)
      @read_book = create(:read_Ready_Player_One_book, category: category_book)
    end
    it 'should return the last entered value for dates that no new value is logged' do
      create(:ledger_day_1, goal: @read_book)
      create(:ledger_day_2, goal: @read_book)
      create(:ledger_day_3, goal: @read_book)
      get :goal_logs, params: { type: 'raising', id: @read_book }
      expect(response.body).to eq(
                                   {
                                       "2018-03-17": "50.0",
                                       "2018-03-18": "50.0",
                                       "2018-03-19": "50.0",
                                       "2018-03-20": "60.0",
                                       "2018-03-21": "60.0",
                                       "2018-03-22": "60.0",
                                       "2018-03-23": "60.0",
                                       "2018-03-24": "60.0",
                                       "2018-03-25": "60.0",
                                       "2018-03-26": "60.0",
                                       "2018-03-27": "90.0"
                                   }.to_json
                               )
    end
  end
end