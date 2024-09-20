require "test_helper"

class SolaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sola_index_url
    assert_response :success
  end
end
