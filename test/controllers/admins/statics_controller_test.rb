require 'test_helper'

class Admins::StaticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_statics_index_url
    assert_response :success
  end

end
