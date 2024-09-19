require "application_system_test_case"

class KleidersTest < ApplicationSystemTestCase
  setup do
    @kleider = kleiders(:one)
  end

  test "visiting the index" do
    visit kleiders_url
    assert_selector "h1", text: "Kleiders"
  end

  test "should create kleider" do
    visit kleiders_url
    click_on "New kleider"

    fill_in "Description", with: @kleider.description
    fill_in "Image", with: @kleider.image
    fill_in "Name", with: @kleider.name
    fill_in "Price", with: @kleider.price
    fill_in "Size", with: @kleider.size
    click_on "Create Kleider"

    assert_text "Kleider was successfully created"
    click_on "Back"
  end

  test "should update Kleider" do
    visit kleider_url(@kleider)
    click_on "Edit this kleider", match: :first

    fill_in "Description", with: @kleider.description
    fill_in "Image", with: @kleider.image
    fill_in "Name", with: @kleider.name
    fill_in "Price", with: @kleider.price
    fill_in "Size", with: @kleider.size
    click_on "Update Kleider"

    assert_text "Kleider was successfully updated"
    click_on "Back"
  end

  test "should destroy Kleider" do
    visit kleider_url(@kleider)
    click_on "Destroy this kleider", match: :first

    assert_text "Kleider was successfully destroyed"
  end
end
