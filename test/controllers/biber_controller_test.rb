require "test_helper"

class BiberControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get biber_index_url
    assert_response :success
  end
end
