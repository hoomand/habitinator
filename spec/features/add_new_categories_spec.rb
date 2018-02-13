require 'rails_helper'

feature "Signed in user creates category", type: :feature do

  before(:each) do
    @user = create(:user)
    login_as @user
    @category_book = build(:category_book, user: @user)
  end

  scenario 'with valid input' do
    visit new_admin_category_path
    fill_in 'category[name]', with: @category_book.name
    choose 'category_unit_type_number'
    fill_in 'category[unit_name]', with: @category_book.unit_name
    click_button 'Submit'

    expect(page).to have_content "Category created successfully"
  end

  scenario 'with missing input' do
    visit new_admin_category_path
    fill_in 'category[name]', with: ''
    choose 'category_unit_type_number'
    fill_in 'category[unit_name]', with: @category_book.unit_name
    click_button 'Submit'

    expect(page).to have_content "Name can't be blank"
  end
end
