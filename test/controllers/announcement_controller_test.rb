require 'test_helper'

class AnnouncementControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get announcement_new_url
    assert_response :success
  end

end
