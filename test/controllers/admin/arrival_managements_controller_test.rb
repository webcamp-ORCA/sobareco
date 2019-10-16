require 'test_helper'

class Admin::ArrivalManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_arrival_managements_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_arrival_managements_create_url
    assert_response :success
  end

  test "should get index" do
    get admin_arrival_managements_index_url
    assert_response :success
  end

end
