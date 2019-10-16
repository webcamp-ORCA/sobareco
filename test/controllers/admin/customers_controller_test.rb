require 'test_helper'

class Admin::CustomersControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get admin_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_customers_show_url
    assert_response :success
  end

  test "should get purchase_history" do
    get admin_customers_purchase_history_url
    assert_response :success
  end

  test "should get create" do
    get admin_customers_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_customers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_customers_destroy_url
    assert_response :success
  end

  test "should get destroy_confirm" do
    get admin_customers_destroy_confirm_url
    assert_response :success
  end

>>>>>>> master
end
