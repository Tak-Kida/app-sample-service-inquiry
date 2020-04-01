require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new" do
    get new_path
    assert_response :success
  end

  #test "should get confirm" do
    #
  #end

  test "should get done" do
    get done_path
    assert_response :success
  end

  test "should get index" do
    get index_path
    assert_response :success
  end

  test "should get index_today" do
    get index_today_path
    assert_response :success
  end

  test "should get index_urgent" do
    get index_urgent_path
    assert_response :success
  end
end