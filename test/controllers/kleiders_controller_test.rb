require "test_helper"

class KleidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kleider = kleiders(:one)
  end

  test "should get index" do
    get kleiders_url
    assert_response :success
  end

  test "should get new" do
    get new_kleider_url
    assert_response :success
  end

  test "should create kleider" do
    assert_difference("Kleider.count") do
      post kleiders_url, params: { kleider: { description: @kleider.description, image: @kleider.image, name: @kleider.name, price: @kleider.price, size: @kleider.size } }
    end

    assert_redirected_to kleider_url(Kleider.last)
  end

  test "should show kleider" do
    get kleider_url(@kleider)
    assert_response :success
  end

  test "should get edit" do
    get edit_kleider_url(@kleider)
    assert_response :success
  end

  test "should update kleider" do
    patch kleider_url(@kleider), params: { kleider: { description: @kleider.description, image: @kleider.image, name: @kleider.name, price: @kleider.price, size: @kleider.size } }
    assert_redirected_to kleider_url(@kleider)
  end

  test "should destroy kleider" do
    assert_difference("Kleider.count", -1) do
      delete kleider_url(@kleider)
    end

    assert_redirected_to kleiders_url
  end
end
