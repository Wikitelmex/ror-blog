require 'rails_helper'

RSpec.describe 'root page', type: :system do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  after do
    Warden.test_reset!
  end

  describe 'home page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content("Alex's Blog")
    end
  end
end
