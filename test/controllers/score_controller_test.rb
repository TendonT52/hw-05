require "test_helper"

class ScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get score_list_url
    assert_response :success
  end

  test "should get edit" do
    get score_edit_url
    assert_response :success
  end
end
