require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'Users action should render index template' do
    get users_url
    assert_response :success

    get users_url, params: { id: 1 }
    assert_response :success
  end
end
