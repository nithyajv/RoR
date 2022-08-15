require "application_system_test_case"

class TasklistsTest < ApplicationSystemTestCase
  setup do
    @tasklist = tasklists(:one)
  end

  test "visiting the index" do
    visit tasklists_url
    assert_selector "h1", text: "Tasklists"
  end

  test "should create tasklist" do
    visit tasklists_url
    click_on "New tasklist"

    fill_in "Details", with: @tasklist.Details
    fill_in "Duedate", with: @tasklist.Duedate
    check "Status" if @tasklist.Status
    fill_in "Taskname", with: @tasklist.Taskname
    click_on "Create Tasklist"

    assert_text "Tasklist was successfully created"
    click_on "Back"
  end

  test "should update Tasklist" do
    visit tasklist_url(@tasklist)
    click_on "Edit this tasklist", match: :first

    fill_in "Details", with: @tasklist.Details
    fill_in "Duedate", with: @tasklist.Duedate
    check "Status" if @tasklist.Status
    fill_in "Taskname", with: @tasklist.Taskname
    click_on "Update Tasklist"

    assert_text "Tasklist was successfully updated"
    click_on "Back"
  end

  test "should destroy Tasklist" do
    visit tasklist_url(@tasklist)
    click_on "Destroy this tasklist", match: :first

    assert_text "Tasklist was successfully destroyed"
  end
end
