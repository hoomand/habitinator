require 'rails_helper'

feature 'goal management', type: :feature do
  context 'signed-in user' do
    before(:each) do
      @user = create(:user)
      login_as @user
      @category_book = create(:category_book, user: @user)
      @category_gym = create(:category_gym, user: @user)
      @category_kindle = create(:category_kindle, user: @user)
    end
    scenario 'creates a book-reading goal' do
      read_book = build(:read_Ready_Player_One_book, category: @category_book)
      visit new_admin_goal_path
      fill_in 'goal[name]', with: read_book.name
      select @category_book.name, from: 'goal[category_id]'
      choose "goal_frequency_#{read_book.frequency}"

      fill_in 'goal[goal_value]', with: read_book.goal_value
      click_button 'Submit'
      expect(page).to have_content 'Goal created successfully'
    end

    scenario 'creates a gym going goal' do
      gym = build(:attend_body_pump, category: @category_gym)
      visit new_admin_goal_path
      fill_in 'goal[name]', with: gym.name
      select @category_gym.name, from: 'goal[category_id]'
      choose "goal_frequency_#{gym.frequency}"
      fill_in 'goal[goal_value]', with: gym.goal_value

      click_button 'Submit'
      expect(page).to have_content 'Goal created successfully'
    end

    scenario 'edits book-reading goal' do
      read_book = create(:read_Ready_Player_One_book, category: @category_book)
      visit admin_goals_path
      click_link("edit_goal_#{read_book.id}")

      expect(page).to have_selector('#goal_value_div', visible: true)
      fill_in 'goal[name]', with: "#{read_book.name}_kindle_version"
      select @category_kindle.name, from: 'goal[category_id]'
      expect(page).to have_selector('#goal_value_div', visible: true)
      choose 'goal_frequency_monthly'

      click_button 'Submit'
      expect(page).to have_content 'Goal updated'
    end

    scenario 'show book-reading goal' do
      read_book = create(
        :read_Ready_Player_One_book,
        category: @category_book
      )
      create(:ledger_day_1, goal: read_book, created_at: DateTime.now.strftime('%Y-%m-%d'))
      create(:ledger_day_2, goal: read_book, created_at: DateTime.now.strftime('%Y-%m-%d'))

      visit admin_goal_path(read_book)
      expect(page).to have_content '110 out of 385 today'
      expect(page).to have_selector('.simple-calendar')
    end

    scenario 'delete goal', js: true do
      read_book = create(:read_Ready_Player_One_book, category: @category_book)
      visit admin_goals_path
      page.accept_alert 'Are you sure?' do
        click_link("delete_goal_#{read_book.id}")
      end

      expect(page).to have_content "Goal #{read_book.name} was successfully deleted"
    end
  end
end
