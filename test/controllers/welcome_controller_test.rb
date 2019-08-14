require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'home_title_and_link' do
    get root_url
    assert_response :ok
    assert_select 'h1', 'Welcome to your empty house!'
    assert_select 'a[href="/images/new"]'
  end
end
