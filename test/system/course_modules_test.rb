require "application_system_test_case"

class CourseModulesTest < ApplicationSystemTestCase
  setup do
    @course_module = course_modules(:one)
  end

  test "visiting the index" do
    visit course_modules_url
    assert_selector "h1", text: "Course Modules"
  end

  test "creating a Course module" do
    visit course_modules_url
    click_on "New Course Module"

    fill_in "Code", with: @course_module.code
    fill_in "Lecturer", with: @course_module.lecturer
    fill_in "Name", with: @course_module.name
    fill_in "Year", with: @course_module.year
    click_on "Create Course module"

    assert_text "Course module was successfully created"
    click_on "Back"
  end

  test "updating a Course module" do
    visit course_modules_url
    click_on "Edit", match: :first

    fill_in "Code", with: @course_module.code
    fill_in "Lecturer", with: @course_module.lecturer
    fill_in "Name", with: @course_module.name
    fill_in "Year", with: @course_module.year
    click_on "Update Course module"

    assert_text "Course module was successfully updated"
    click_on "Back"
  end

  test "destroying a Course module" do
    visit course_modules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course module was successfully destroyed"
  end
end
