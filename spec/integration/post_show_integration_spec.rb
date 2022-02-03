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

  describe 'show page' do
    it 'I can see the posts title' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(@post.title)
    end

    it 'I can see who wrote the post' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(@user.name)
    end

    it 'I can see how many comments it has' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content("Comments: #{@post.comments_counter + 1}")
      # we add 1 because we have the comment we created in the before block
    end

    it 'I can see how many likes it has' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end

    it 'I can see the post body' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(@post.text)
    end

    it 'I can see the username of each commentor' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content("#{@post.comments[0].author.name}:")
    end

    it 'I can see the username of each commentor' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content("#{@post.comments[0].author.name}:")
    end
    it 'I can see the comment each commentor left' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content("#{@post.comments[0].author.name}: #{@post.comments[0].text}")
    end
  end
end
