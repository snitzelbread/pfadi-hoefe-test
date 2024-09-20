require "test_helper"

class ArchivControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get archiv_index_url
    assert_response :success
  end
end
