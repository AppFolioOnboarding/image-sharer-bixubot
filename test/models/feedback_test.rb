require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  def  test_feedback
    fb = Feedback.new(name: 'tester', comment: 'testing')

    assert_predicate fb, :valid?
  end

  def test_feedback__name_empty
    fb = Feedback.new(comment: 'testing')

    assert_not_predicate fb, :valid?
  end

  def test_feedback__comment_empty
    fb = Feedback.new(name: 'tester')

    assert_not_predicate fb, :valid?
  end
end
