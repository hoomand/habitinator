require 'rails_helper'

RSpec.describe Goal, type: :model do
  before :each do
    @user = create(:user)
  end
  it 'is valid with valid attributes' do
    category_book = create(:category_book, user: @user)
    goal = Goal.new(name: 'ready book',
                    category: category_book,
                    frequency: 'daily')
    expect(goal).to be_valid
  end
  it 'should add new ledger entries to total for daily goals, no matter the goal type or new_entry_add_to_total value' do
    category_gym = create(:category_gym, user: @user)
    daily_boolean_goal = create(:attend_body_pump,
                                 category: category_gym,
                                 frequency: 'daily',
                                 new_entry_add_to_total: false)
    create(:ledger_day_1,
           goal: daily_boolean_goal,
           created_at: DateTime.now.strftime('%Y-%m-%d'))
    create(:ledger_day_2,
           goal: daily_boolean_goal,
           created_at: DateTime.now.strftime('%Y-%m-%d'))
    expect(daily_boolean_goal.progress).to eq(110)

    category_book = create(:category_book, user: @user)
    daily_numeric_goal = create(:read_Ready_Player_One_book,
                         category: category_book,
                         frequency: 'daily',
                         new_entry_add_to_total: false)
    create(:ledger_day_1,
           goal: daily_numeric_goal,
           created_at: DateTime.now.strftime('%Y-%m-%d'))
    create(:ledger_day_2,
           goal: daily_numeric_goal,
           created_at: DateTime.now.strftime('%Y-%m-%d'))
    expect(daily_numeric_goal.progress).to eq(110)
  end
  it 'should add new ledger entries to total for weekly boolean goals, even when new_entry_add_to_total is false' do
    category_gym = create(:category_gym, user: @user)
    weekly_boolean_goal = create(:attend_body_pump,
                                 category: category_gym,
                                 new_entry_add_to_total: false)
    create(:ledger_day_1,
           goal: weekly_boolean_goal,
           created_at: DateTime.now.strftime('%Y-%m-%d'))
    create(:ledger_day_2,
           goal: weekly_boolean_goal,
           created_at: Time.zone.now.beginning_of_week.strftime('%Y-%m-%d'))
    expect(weekly_boolean_goal.progress).to eq(110)
  end
  it 'should add new ledger entries to total for monthly boolean goals, even when new_entry_add_to_total is false' do
    category_gym = create(:category_gym, user: @user)
    monthly_boolean_goal = create(:attend_body_pump,
                                 category: category_gym,
                                 frequency: 'monthly',
                                 new_entry_add_to_total: false)
    create(:ledger_day_1,
           goal: monthly_boolean_goal,
           created_at: DateTime.now.strftime('%Y-%m-%d'))
    create(:ledger_day_2,
           goal: monthly_boolean_goal,
           created_at: Time.zone.now.beginning_of_month.strftime('%Y-%m-%d'))
    create(:ledger_day_3,
           goal: monthly_boolean_goal,
           created_at: Time.zone.yesterday.strftime('%Y-%m-%d'))
    expect(monthly_boolean_goal.progress).to eq(200)
  end
  it 'should not add new ledger entries to total for weekly non-boolean goals when new_entry_add_to_total is false' do
    category_kindle = create(:category_kindle, user: @user)
    weekly_goal = create(:read_Ready_Player_One_book,
                         category: category_kindle,
                         frequency: 'weekly',
                         new_entry_add_to_total: false)
    create(:ledger_day_1,
           goal: weekly_goal,
           created_at: DateTime.now.strftime('%Y-%m-%d'))
    create(:ledger_day_2,
           goal: weekly_goal,
           created_at: Time.zone.now.beginning_of_week.strftime('%Y-%m-%d'))
    expect(weekly_goal.progress).to eq(50)
  end
  it 'should not add new ledger entries to total for monthly non-boolean goals when new_entry_add_to_total is false' do
    category_kindle = create(:category_kindle, user: @user)
    monthly_goal = create(:read_Ready_Player_One_book,
                         category: category_kindle,
                         frequency: 'monthly',
                         new_entry_add_to_total: false)
    create(:ledger_day_1,
           goal: monthly_goal,
           created_at: DateTime.now.strftime('%Y-%m-%d'))
    create(:ledger_day_2,
           goal: monthly_goal,
           created_at: Time.zone.now.beginning_of_month.strftime('%Y-%m-%d'))
    expect(monthly_goal.progress).to eq(50)
  end
end