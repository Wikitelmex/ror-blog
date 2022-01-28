require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }
    it 'server responses OK? (200OK)' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('users/index')
    end
    it 'includes template text' do
      expect(response.body).to include('Users')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/2' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('users/show')
    end
    it 'includes correct placeholder text' do
      expect(response.body).to include('Recent Posts')
    end
  end
end
