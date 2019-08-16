require 'test_helper'

# rubocop:disable Metrics/ClassLength
class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_index__title_and_link
    get root_url
    assert_response :ok
    assert_select 'h1', 'Welcome to your empty house!'
    assert_select 'a[href="/images/new"]'
  end

  def test_index__check_desc_order
    image1 = Image.create!(url: 'http://example.com/1')
    image2 = Image.create!(url: 'http://example.com/2')
    image3 = Image.create!(url: 'http://example.com/3')

    get images_path
    assert_select 'img' do |images|
      assert_equal images[0].attr('src'), image3.url
      assert_equal images[1].attr('src'), image2.url
      assert_equal images[2].attr('src'), image1.url
    end
  end

  def test_index__tags_with_images
    Image.create!(url: 'http://example.com', tag_list: 'example1')
    Image.create!(url: 'http://example.com', tag_list: 'example2')

    get images_path

    assert_response :ok
    assert_select 'td' do |tags|
      assert_includes tags[0].to_s, 'example2'
      assert_includes tags[1].to_s, 'example1'
    end
  end

  def test_index__all_tag_btn_exist
    Image.create!(url: 'http://example.com', tag_list: 'tag1')
    Image.create!(url: 'http://example.com', tag_list: %w[tag1 tag2])

    get images_path

    assert_response :ok
    assert_select  'a.btn' do |btns|
      assert_equal btns.map(&:text), %w[tag1 tag2]
    end
  end

  def test_index__tag_class_change_on_selection
    Image.create!(url: 'http://example.com/1', tag_list: 'tag')

    get images_path

    assert_response :ok
    assert_select 'a[class="btn btn-secondary"]'

    get images_path(tag: 'tag;')

    assert_response :ok
    assert_select 'a[class="btn btn-primary"]'
  end

  def test_index__images_no_filtering
    Image.create!(url: 'http://example.com/1', tag_list: 'tag')
    Image.create!(url: 'http://example.com/2')

    get images_path

    assert_response :ok
    assert_select 'img' do |images|
      assert_equal images[0].attr('src'), 'http://example.com/2'
      assert_equal images[1].attr('src'), 'http://example.com/1'
    end
  end

  def test_index__images_filtered
    Image.create!(url: 'http://example.com/1', tag_list: '1')
    Image.create!(url: 'http://example.com/2', tag_list: '2')
    Image.create!(url: 'http://example.com')

    get images_path(tag: '1;')

    assert_response :ok
    assert_select 'img' do |images|
      assert_equal images[0].attr('src'), 'http://example.com/1'
    end

    get images_path(tag: '1;2;')

    assert_response :ok
    assert_select 'img' do |images|
      assert_equal images[0].attr('src'), 'http://example.com/2'
      assert_equal images[1].attr('src'), 'http://example.com/1'
    end
  end

  def test_new__input_field_for_url
    get new_image_path
    assert_response :ok
    assert_select 'input[name="image[url]"]'
  end

  def test_new__tag_list_input_field
    get new_image_path

    assert_response :ok
    assert_select 'input[name="image[tag_list]"]'
  end

  def test_show
    image = Image.create!(url: 'http://example.com')

    get image_path(image)

    assert_response :ok
    assert_select 'img[src="http://example.com"]'
  end

  def test_show__tag_with_image
    image = Image.create!(url: 'http://example.com', tag_list: 'example')

    get image_path(image)

    assert_response :ok
    assert_select 'p', 'example'
  end

  def test_create__succeeds
    assert_difference 'Image.count', 1 do
      post images_path, params: { image: { url: 'http://example.com' } }
    end

    assert_redirected_to image_path(Image.last)
  end

  def test_create__fails
    assert_no_difference('Image.count') do
      post images_path, params: { image: { url: nil } }
    end

    assert_response :unprocessable_entity
    assert_select 'input[name="image[url]"]'
  end

  def test_create__add_tag_to_db
    assert_difference 'Image.count' do
      post images_path, params: { image: { url: 'http://example.com', tag_list: 'example' } }
    end

    assert_equal ['example'], Image.last.tag_list
  end
end
# rubocop:enable Metrics/ClassLength
