require 'rails_helper'

RSpec.describe 'User page', type: :system do
  before do
    Capybara.raise_server_errors = false
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, author: @user)
    login_as(@user, scope: :user)
  end

  after do
    Warden.test_reset!
  end

  describe 'show page' do
    it 'shows the right profile picture' do
      visit user_path(@user)
      expect(page.html).to match(@user.photo)
    end

    it 'shows the right username' do
      visit user_path(@user)
      expect(page).to have_content(@user.name)
    end

    it 'shows the right posts counter' do
      visit user_path(@user)
      expect(page).to have_content("Number of posts: #{@user.posts.count}")
    end

    it 'shows the right user bio' do
      visit user_path(@user)
      expect(page).to have_content(@user.bio)
    end

    it 'shows the right user first posts' do
      visit user_path(@user)
      expect(page).to have_content(@user.recent_posts[0].title)
    end

    it 'shows the right user first posts' do
      visit user_path(@user)
      expect(page).to have_content(@user.recent_posts[0].title)
    end

    it 'click on the first users post linkto redirect to that post show page' do
      visit user_path(@user)
      click_link @user.recent_posts[0].title
      expect(page).to have_content('Add new comment')
    end

    it 'click on the see all posts redirects to user posts' do
      visit user_path(@user)
      click_link 'See all posts'
      expect(page).to have_content('Add new post')
    end
  end
end
