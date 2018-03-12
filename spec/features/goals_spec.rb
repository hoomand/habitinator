require 'rails_helper'

feature "goal management", type: :feature do


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
      select @category_book.name, from: "goal[category_id]"
      choose "goal_frequency_#{read_book.frequency}"

      # When category is numeric, we should be able to enter a goal value
      # For example for a book, we can enter 500 to show its number of pages
      expect(page).to have_selector('#goal_value_div', visible: true)

      fill_in 'goal[goal_value]', with: read_book.goal_value
      click_button 'Submit'
      expect(page).to have_content "Goal created successfully"
    end

    scenario 'creates a gym going goal' do
      gym = build(:attend_bodypump, category: @category_gym)
      visit new_admin_goal_path
      fill_in 'goal[name]', with: gym.name
      select @category_gym.name, from: "goal[category_id]"
      choose "goal_frequency_#{gym.frequency}"

      # When category is not of type numeric, goal value should not be visible
      # For gym, you just want to go, or for kindle book, goal value is 100% obviously
      expect(page).to have_selector('#goal_value_div', visible: false)

      click_button 'Submit'
      expect(page).to have_content "Goal created successfully"
    end

    scenario 'edits book-reading goal' do
      read_book = create(:read_Ready_Player_One_book, category: @category_book)
      visit admin_goals_path
      click_link("edit_goal_#{read_book.id}")

      # goal value should be visible for a category of type numeric, i.e. book
      expect(page).to have_selector('#goal_value_div', visible: true)
      fill_in 'goal[name]', with: "#{read_book.name}_kindle_version"
      select @category_kindle.name, from: 'goal[category_id]'
      # goal value should become invisible after changing category to kindle
      expect(page).to have_selector('#goal_value_div', visible: true)
      choose "goal_frequency_monthly"

      click_button 'Submit'
      expect(page).to have_content "Goal updated"
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

