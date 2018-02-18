require 'rails_helper'

feature "category management", type: :feature do


  context 'signed-in user' do
    before(:each) do
      @user = create(:user)
      login_as @user
    end
    scenario 'creates category of type Numeric' do
      category_book = build(:category_book, user: @user)
      visit new_admin_category_path
      fill_in 'category[name]', with: category_book.name
      choose 'category_unit_type_number'
      fill_in 'category[unit_name]', with: category_book.unit_name
      click_button 'Submit'

      expect(page).to have_content "Category created successfully"
    end

    scenario 'creates category without a name' do
      category_book = build(:category_book, user: @user)
      visit new_admin_category_path
      fill_in 'category[name]', with: ''
      choose 'category_unit_type_number'
      fill_in 'category[unit_name]', with: category_book.unit_name
      click_button 'Submit'

    expect(page).to have_content "Category created successfully"
  end

  context 'anonymous user gets denied' do
    scenario 'listing categories' do
      visit admin_categories_path
      expect(page).to have_content "You need to sign in or sign up before continuing"
    end

    scenario 'creating categories' do
      visit new_admin_category_path
      expect(page).to have_content "You need to sign in or sign up before continuing"
    end
  end

end
