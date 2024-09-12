require "test_helper"

class AnmeldungControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get anmeldung_new_url
    assert_response :success
  end

  test "should get create" do
    get anmeldung_create_url
    assert_response :success
  end
end
