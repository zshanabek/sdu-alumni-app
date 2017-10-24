require 'test_helper'

class FlightControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flight_index_url
    assert_response :success
  end

  test "should get delete" do
    get flight_delete_url
    assert_response :success
  end

  test "should get update" do
    get flight_update_url
    assert_response :success
  end

  test "should get show" do
    get flight_show_url
    assert_response :success
  end

  test "should get create" do
    get flight_create_url
    assert_response :success
  end

end
