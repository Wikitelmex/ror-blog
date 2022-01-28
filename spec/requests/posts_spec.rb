require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/2/posts' }
    it 'server responses OK? (200OK)' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('posts/index')
    end
    it 'includes template text' do
      expect(response.body).to include('Posts of')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/2/posts/1' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('posts/show')
    end
    it 'includes correct placeholder text' do
      expect(response.body).to include('Comments:')
    end
  end
end
