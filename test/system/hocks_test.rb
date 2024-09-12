require "application_system_test_case"

class HocksTest < ApplicationSystemTestCase
  setup do
    @hock = hocks(:one)
  end

  test "visiting the index" do
    visit hocks_url
    assert_selector "h1", text: "Hocks"
  end

  test "should create hock" do
    visit hocks_url
    click_on "New hock"

    fill_in "Description", with: @hock.description
    fill_in "Title", with: @hock.title
    click_on "Create Hock"

    assert_text "Hock was successfully created"
    click_on "Back"
  end

  test "should update Hock" do
    visit hock_url(@hock)
    click_on "Edit this hock", match: :first

    fill_in "Description", with: @hock.description
    fill_in "Title", with: @hock.title
    click_on "Update Hock"

    assert_text "Hock was successfully updated"
    click_on "Back"
  end

  test "should destroy Hock" do
    visit hock_url(@hock)
    click_on "Destroy this hock", match: :first

    assert_text "Hock was successfully destroyed"
  end
end
