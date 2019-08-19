require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  def test_new
    get new_feedback_path

    assert_response :ok
  end
end
