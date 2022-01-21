require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'Pages root uri should render home mainpage template' do
    get '/'
    assert_response :success
  end
end
