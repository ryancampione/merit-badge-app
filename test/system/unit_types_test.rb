require "application_system_test_case"

class UnitTypesTest < ApplicationSystemTestCase
  setup do
    @unit_type = unit_types(:one)
  end

  test "visiting the index" do
    visit unit_types_url
    assert_selector "h1", text: "Unit Types"
  end

  test "creating a Unit type" do
    visit unit_types_url
    click_on "New Unit Type"

    fill_in "Active", with: @unit_type.active
    fill_in "Order", with: @unit_type.order
    fill_in "Updated By", with: @unit_type.updated_by
    fill_in "Value", with: @unit_type.value
    click_on "Create Unit type"

    assert_text "Unit type was successfully created"
    click_on "Back"
  end

  test "updating a Unit type" do
    visit unit_types_url
    click_on "Edit", match: :first

    fill_in "Active", with: @unit_type.active
    fill_in "Order", with: @unit_type.order
    fill_in "Updated By", with: @unit_type.updated_by
    fill_in "Value", with: @unit_type.value
    click_on "Update Unit type"

    assert_text "Unit type was successfully updated"
    click_on "Back"
  end

  test "destroying a Unit type" do
    visit unit_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unit type was successfully destroyed"
  end
end
