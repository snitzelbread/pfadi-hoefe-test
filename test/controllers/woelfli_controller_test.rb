require "test_helper"

class WoelfliControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get woelfli_index_url
    assert_response :success
  end
end
