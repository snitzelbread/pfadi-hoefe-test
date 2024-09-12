require "test_helper"

class LogInControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get log_in_new_url
    assert_response :success
  end

  test "should get create" do
    get log_in_create_url
    assert_response :success
  end
end
