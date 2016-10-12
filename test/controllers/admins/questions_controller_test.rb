require 'test_helper'

class Admins::QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_questions_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_questions_create_url
    assert_response :success
  end

  test "should get edit" do
    get admins_questions_edit_url
    assert_response :success
  end

end
