require 'rails_helper'

RSpec.describe 'Post page', type: :system do
  before do
    Capybara.raise_server_errors = false
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, author: @user)
    @comment = FactoryBot.create(:comment, post: @post, author: @user)
    login_as(@user, scope: :user)
  end

  after do
    Warden.test_reset!
  end

  describe 'index page' do
    it 'shows the right profile picture' do
      visit user_posts_path(user_id: @user.id)
      expect(page.html).to match(@user.photo)
    end

    it 'shows the right username' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@user.name)
    end

    it 'shows the right posts counter' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content("Number of posts: #{@user.posts.count}")
    end

    it 'I can see a posts title' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@post.title)
    end

    it 'I can see some of the posts body' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@post.text)
    end

    it 'I can see the first comments on a post.' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@post.recent_comments[0].text)
    end

    it 'I can see how many comments a post has' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content("Comments: #{@post.comments_counter + 1}")
      # we add 1 because we have the comment we created in the before block
    end

    it 'I can see how many likes a post has.' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end

    it 'I can see a section for pagination if there are more posts than fit on the view' do
      visit user_posts_path(user_id: @user.id)
      expect(@post.comments_counter).to match(1234)
    end

    it 'When I click on a post, it redirects me to that posts show page' do
      visit user_posts_path(user_id: @user.id)
      click_link @post.title
      expect(page).to have_content('Add new comment')
    end
  end
end
