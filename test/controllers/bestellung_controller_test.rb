require "test_helper"

class BestellungControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bestellung_new_url
    assert_response :success
  end

  test "should get create" do
    get bestellung_create_url
    assert_response :success
  end
end
