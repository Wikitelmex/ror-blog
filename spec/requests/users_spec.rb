require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }
    it 'server responses OK? (200OK)' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('users/index')
    end
    it 'includes template text' do
      expect(response.body).to include('users index')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1' }
    it 'server responses OK? (200OK)' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('users/show')
    end
    it 'includes template text' do
      expect(response.body).to include('the user id is: 1')
    end
  end
end
