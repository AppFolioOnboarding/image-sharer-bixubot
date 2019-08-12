require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should print title' do
    get root_url
    assert_response :success
    assert_select 'h1', 'New Article'
  end
end
