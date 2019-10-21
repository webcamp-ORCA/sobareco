require 'test_helper'

class Public::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_products_show_url
    assert_response :success
  end

  test "should get index" do
    get public_products_index_url
    assert_response :success
  end

  test "should get genre_index" do
    get public_products_genre_index_url
    assert_response :success
  end

end
