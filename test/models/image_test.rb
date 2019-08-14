require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'save succeeds' do
    image = Image.new(url: 'http://example.com/123.jpg')
    assert_predicate image, :valid?
  end

  test 'validates empty url' do
    image = Image.new

    refute_predicate image, :valid?
    assert_equal ["can't be blank", 'must be a valid URL'], image.errors[:url]
  end

  test 'validates wrong url' do
    image = Image.new(url: 'foo')
    refute_predicate image, :valid?
    assert_equal ['must be a valid URL'], image.errors[:url]
  end
end
