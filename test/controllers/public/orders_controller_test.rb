require 'test_helper'

class Public::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_orders_show_url
    assert_response :success
  end

  test "should get order_confirm" do
    get public_orders_order_confirm_url
    assert_response :success
  end

  test "should get index" do
    get public_orders_index_url
    assert_response :success
  end

  test "should get new" do
    get public_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get public_orders_create_url
    assert_response :success
  end

end
