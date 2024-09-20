require "test_helper"

class WolaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wola_index_url
    assert_response :success
  end
end
