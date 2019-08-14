require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'new' do
    get new_image_path
    assert_response :ok
    assert_select 'input[name="image[url]"]'
  end

  test 'show' do
    image = Image.create!(url: 'http://example.com')

    get image_path(image)

    assert_response :ok
    assert_select 'img[src="http://example.com"]'
  end

  test 'create succeeds' do
    assert_difference 'Image.count', 1 do
      post images_path, params: { image: { url: 'http://example.com' } }
    end

    assert_redirected_to image_path(Image.last)
  end

  test 'create fails' do
    assert_no_difference('Image.count') do
      post images_path, params: { image: { url: nil } }
    end

    assert_response :unprocessable_entity
    assert_select 'input[name="image[url]"]'
  end
end
