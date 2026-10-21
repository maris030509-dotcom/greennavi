require "test_helper"

class CommunityCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get community_comments_edit_url
    assert_response :success
  end
end
