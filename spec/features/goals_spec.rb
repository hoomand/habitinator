require 'rails_helper'

feature "goal management", type: :feature do


  context 'signed-in user' do
    before(:each) do
      @user = create(:user)
      login_as @user
      @cb = create(:category_book, user: @user)
      @cg = create(:category_gym, user: @user)
    end
    scenario 'creates a book-reading goal' do
      read_book = build(:read_Ready_Player_One_book, category: @cb)
      visit new_admin_goal_path
      fill_in 'goal[name]', with: read_book.name
      choose "goal_frequency_#{read_book.frequency}"
      fill_in 'goal[goal_value]', with: read_book.goal_value
      click_button 'Submit'
      expect(page).to have_content "Goal created successfully"
    end

    scenario 'creates a gym going goal' do
      gym = build(:attend_bodypump, category: @cg)
      visit new_admin_goal_path
      fill_in 'goal[name]', with: gym.name
      choose "goal_frequency_#{gym.frequency}"
      click_button 'Submit'
      expect(page).to have_content "Goal created successfully"
    end
  end
end

