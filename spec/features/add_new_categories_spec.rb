require 'rails_helper'
require_relative '../helpers/authentication'

RSpec.configure do |c|
  c.include Helpers::Authentication
end

feature "Signed in user creates category", type: :feature do

  scenario 'with valid input' do
    u = create(:user)
    sign_in_as(u)

    category_book = build(:category_book, user: u)

    visit new_admin_category_path
    fill_in 'category[name]', with: category_book.name
    choose 'category_unit_type_number'
    fill_in 'category[unit_name]', with: category_book.unit_name
    click_button 'Submit'

    expect(page).to have_content "Category created successfully"
  end

  scenario 'with missing input' do
    u = create(:user)
    sign_in_as(u)

    category_book = build(:category_book, user: u)

    visit new_admin_category_path
    fill_in 'category[name]', with: ''
    choose 'category_unit_type_number'
    fill_in 'category[unit_name]', with: category_book.unit_name
    click_button 'Submit'

    expect(page).to have_content "Name can't be blank"
  end
end
