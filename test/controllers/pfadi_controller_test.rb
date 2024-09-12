require "test_helper"

class PfadiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pfadi_index_url
    assert_response :success
  end
end
