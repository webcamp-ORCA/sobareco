require 'test_helper'

class ArrivalManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get arrival_management_new_url
    assert_response :success
  end

  test "should get create" do
    get arrival_management_create_url
    assert_response :success
  end

  test "should get index" do
    get arrival_management_index_url
    assert_response :success
  end

end
