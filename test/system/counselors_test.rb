require "application_system_test_case"

class CounselorsTest < ApplicationSystemTestCase
  setup do
    @counselor = counselors(:one)
  end

  test "visiting the index" do
    visit counselors_url
    assert_selector "h1", text: "Counselors"
  end

  test "creating a Counselor" do
    visit counselors_url
    click_on "New Counselor"

    fill_in "Email", with: @counselor.email
    fill_in "Help Others", with: @counselor.help_others
    fill_in "Name", with: @counselor.name
    fill_in "Phone", with: @counselor.phone
    fill_in "Unit Number", with: @counselor.unit_number
    fill_in "Ypt", with: @counselor.ypt
    click_on "Create Counselor"

    assert_text "Counselor was successfully created"
    click_on "Back"
  end

  test "updating a Counselor" do
    visit counselors_url
    click_on "Edit", match: :first

    fill_in "Email", with: @counselor.email
    fill_in "Help Others", with: @counselor.help_others
    fill_in "Name", with: @counselor.name
    fill_in "Phone", with: @counselor.phone
    fill_in "Unit Number", with: @counselor.unit_number
    fill_in "Ypt", with: @counselor.ypt
    click_on "Update Counselor"

    assert_text "Counselor was successfully updated"
    click_on "Back"
  end

  test "destroying a Counselor" do
    visit counselors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Counselor was successfully destroyed"
  end
end
