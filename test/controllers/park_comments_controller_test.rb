require "test_helper"

class ParkCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get park_comments_edit_url
    assert_response :success
  end
end
