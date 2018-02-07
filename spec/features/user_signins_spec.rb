require 'rails_helper'

RSpec.feature "UserSignins", type: :feature do
  it 'should allow a signed up user to sign in and out' do
    u = create(:user)
    visit new_user_session_url

    within '#new_user' do
      fill_in "user[email]", with: u.email
      fill_in "user[password]", with: u.password
    end

    click_button "Login"
    expect(page).to have_content u.full_name

    click_link 'logout'
    expect(page).to have_content 'An open source habit tracker'
  end

  it 'should stop login for an invalid user' do
    visit new_user_session_url
    within '#new_user' do
      fill_in "user[email]", with: 'kkkk@blahblah.com'
      fill_in "user[password]", with: 'sdlfkjweoriuwe'
    end

    click_button "Login"
    expect(page).to have_content 'Invalid Email or password.'
  end
end
