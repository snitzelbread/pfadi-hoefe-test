require "test_helper"

class VereinControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get verein_index_url
    assert_response :success
  end
end
