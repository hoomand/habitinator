module Helpers
  module Authentication
    def sign_in_as(user)
      visit new_user_session_url

      within '#new_user' do
        fill_in "user[email]", with: user.email
        fill_in "user[password]", with: user.password
      end

      click_button "Login"
    end
  end
end