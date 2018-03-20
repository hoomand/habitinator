require 'rails_helper'

feature "log goals", type: :feature do


  context 'signed-in user' do
    before(:each) do
      @user = create(:user)
      login_as @user

      @category_book = create(:category_book, user: @user)
      @category_gym = create(:category_gym, user: @user)
      @category_kindle = create(:category_kindle, user: @user)

    end
    scenario 'log Yes and then No for a goal with category type of boolean' do
      body_pump = create(:attend_body_pump, category: @category_gym)
      visit admin_goals_path
      click_link "log_goal_#{body_pump.id}"

      expect(page).to have_content("Want to clock in another #{body_pump.name} today?")
      expect(page).to have_css('#no_label.active')
      choose 'ledger_value_1'
      click_button 'Submit'
      expect(Ledger.where(id: 1, goal_id: body_pump.id, value: 1)).to exist
      expect(page).to have_content("Progress for #{body_pump.name} was saved successfully")

      # Update progress to No
      click_link "log_goal_#{body_pump.id}"
      expect(page).to have_content("Want to clock in another #{body_pump.name} today?")
      expect(page).to have_css('#yes_label.active')
      # Choose No radio button
      choose 'ledger_value_0'
      click_button 'Submit'
      expect(Ledger.where(id: 1, goal_id: body_pump.id, value: 0)).to exist
      expect(page).to have_content("Progress updated for #{body_pump.name}")
    end

    scenario 'log a goal with category type of numeric' do
      read_book = create(:read_Ready_Player_One_book, category: @category_book)
      visit admin_goals_path
      click_link "log_goal_#{read_book.id}"

      expect(page).to have_content("New Progress:")
      fill_in 'ledger[value]', with: '52'
      click_button 'Submit'
      expect(Ledger.where(id: 1, goal_id: read_book.id, value: 52)).to exist
      expect(page).to have_content("Progress for #{read_book.name} was saved successfully")

      # Update progress to 65
      click_link "log_goal_#{read_book.id}"
      expect(page).to have_content("New Progress:")
      expect(find_field('ledger[value]').value).to eq '52.0'
      fill_in 'ledger[value]', with: '65'
      click_button 'Submit'
      expect(Ledger.where(id: 1, goal_id: read_book.id, value: 65)).to exist
      expect(page).to have_content("Progress updated for #{read_book.name}")
    end
  end
end

