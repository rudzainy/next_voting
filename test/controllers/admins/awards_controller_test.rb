require 'test_helper'

class Admins::AwardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_awards_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_awards_create_url
    assert_response :success
  end

  test "should get show" do
    get admins_awards_show_url
    assert_response :success
  end

  test "should get index" do
    get admins_awards_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_awards_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_awards_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_awards_destroy_url
    assert_response :success
  end

end
