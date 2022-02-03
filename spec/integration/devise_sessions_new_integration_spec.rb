require 'rails_helper'

RSpec.describe 'Sessions page', type: :system do
  before do
    Capybara.raise_server_errors = false
    @user = FactoryBot.create(:user)
  end

  after do
    Warden.test_reset!
  end

  describe 'new login page' do
    it 'I can see the username and password inputs and the Submit button' do
      visit new_user_session_path
      expect(page.html).to match('user_email')
      expect(page.html).to match('user_password')
      expect(page.html).to match('commit')
    end

    it 'When I click the submit button without filling in the username and the password, I get a detailed error.' do
      visit new_user_session_path(email: '', password: '')
      click_button 'Log in'
      expect(page).to have_content('Email and password cant be blank')
    end

    it 'When I click the submit button after filling in the username and password with incorrect data get a error' do
      visit new_user_session_path(email: 'sdfsdf@sdfsdfcom', password: 'fakepassword')
      click_button 'Log in'
      expect(page).to have_content('Email or password is invalid')
    end

    it 'I click the submit button after filling in the username and the password with correct data' do
      visit new_user_session_path(email: @user.email, password: @user.password)
      click_button 'Log in'
      expect(page).to have_content('see all users')
    end
  end
end
