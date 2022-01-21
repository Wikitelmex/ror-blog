require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'Posts action should render index template' do
    get '/users/1/posts'
    assert_response :success

    get '/users/1/posts/1'
    assert_response :success
  end
end
