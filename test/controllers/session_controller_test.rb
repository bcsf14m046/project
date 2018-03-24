require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get sess" do
    get session_sess_url
    assert_response :success
  end

end
