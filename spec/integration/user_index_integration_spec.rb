require 'rails_helper'

RSpec.describe 'User page', type: :system do
  before do
    Capybara.raise_server_errors = false
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  after do
    Warden.test_reset!
  end

  describe 'index page' do
    it 'shows the right username' do
      visit users_path
      expect(page).to have_content(@user.name)
    end

    it 'shows the right photo' do
      visit users_path
      expect(page).to have_content(@user.photo)
    end

    it 'shows the right posts counter' do
      visit users_path
      expect(page).to have_content("Number of posts: #{@user.postscounter}")
    end

    it 'click on the user name' do
      visit users_path
      click_link 'alex user name'
      expect(page).to have_content('Back to User')
    end
  end
end
