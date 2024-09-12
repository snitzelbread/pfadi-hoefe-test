require "test_helper"

class PiosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pios_index_url
    assert_response :success
  end
end
