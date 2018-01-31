require 'test_helper'

class Admin::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_home_index_url
    assert_response :success
  end

end
