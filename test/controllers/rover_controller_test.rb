require "test_helper"

class RoverControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rover_index_url
    assert_response :success
  end
end
