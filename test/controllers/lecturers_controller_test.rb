require 'test_helper'

class LecturersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lecturers_index_url
    assert_response :success
  end

  test "should get new" do
    get lecturers_new_url
    assert_response :success
  end

  test "should get create" do
    get lecturers_create_url
    assert_response :success
  end

  test "should get update" do
    get lecturers_update_url
    assert_response :success
  end

  test "should get edit" do
    get lecturers_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get lecturers_destroy_url
    assert_response :success
  end

end
