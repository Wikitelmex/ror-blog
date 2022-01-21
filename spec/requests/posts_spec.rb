require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/1/posts' }
    it 'server responses OK? (200OK)' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('posts/index')
    end
    it 'includes template text' do
      expect(response.body).to include('Posts of user 1')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1/posts/3' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('posts/show')
    end
    it 'includes correct placeholder text' do
      expect(response.body).to include('user id: 1 post id: 3')
    end
  end
end
