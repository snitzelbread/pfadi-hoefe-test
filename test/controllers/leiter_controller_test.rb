require "test_helper"

class LeiterControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get leiter_new_url
    assert_response :success
  end

  test "should get create" do
    get leiter_create_url
    assert_response :success
  end
end
