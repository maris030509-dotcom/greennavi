require "test_helper"

class Admin::PlaygroundsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_playgrounds_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_playgrounds_edit_url
    assert_response :success
  end
end
