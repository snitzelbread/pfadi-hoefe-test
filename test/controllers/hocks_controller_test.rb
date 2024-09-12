require "test_helper"

class HocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hock = hocks(:one)
  end

  test "should get index" do
    get hocks_url
    assert_response :success
  end

  test "should get new" do
    get new_hock_url
    assert_response :success
  end

  test "should create hock" do
    assert_difference("Hock.count") do
      post hocks_url, params: { hock: { description: @hock.description, title: @hock.title } }
    end

    assert_redirected_to hock_url(Hock.last)
  end

  test "should show hock" do
    get hock_url(@hock)
    assert_response :success
  end

  test "should get edit" do
    get edit_hock_url(@hock)
    assert_response :success
  end

  test "should update hock" do
    patch hock_url(@hock), params: { hock: { description: @hock.description, title: @hock.title } }
    assert_redirected_to hock_url(@hock)
  end

  test "should destroy hock" do
    assert_difference("Hock.count", -1) do
      delete hock_url(@hock)
    end

    assert_redirected_to hocks_url
  end
end
