require 'rails_helper'

RSpec.describe 'Sessions page', type: :system do
  before do
    Capybara.raise_server_errors = false
    # @user = FactoryBot.create(:user)
    # @post = FactoryBot.create(:post, author: @user)
    # login_as(@user, scope: :user)
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
  end
end
