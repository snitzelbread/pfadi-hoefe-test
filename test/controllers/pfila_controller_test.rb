require "test_helper"

class PfilaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pfila_index_url
    assert_response :success
  end
end
