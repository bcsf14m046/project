require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get user_start_url
    assert_response :success
  end

end
