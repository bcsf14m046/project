require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get ajau" do
    get login_ajau_url
    assert_response :success
  end

end
