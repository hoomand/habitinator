require 'test_helper'

class Admin::GoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_goals_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_goals_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_goals_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_goals_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_goals_delete_url
    assert_response :success
  end

end
