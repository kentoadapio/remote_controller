require 'test_helper'

class RemoteControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get remote_controller_home_url
    assert_response :success
  end

  test "should get log" do
    get remote_controller_log_url
    assert_response :success
  end

end
