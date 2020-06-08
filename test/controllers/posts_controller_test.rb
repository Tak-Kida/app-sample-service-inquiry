require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  #deviseによるログイン
  include Warden::Test::Helpers

  def setup
    @user = users(:demo)
    @post = posts(:urgent_unsolved)
  end
  
  #利用者向けページが開くことの確認
  test "should get new" do
    get new_path
    assert_response :success
  end

  test "should get confirm" do
    get new_path
    assert_response :success
  end

  test "should get done" do
    get done_path
    assert_response :success
  end

  #管理者向けページがログイン時に開くことを確認
  test "should get index" do
    login_as(@user, scope: :user)
    get index_path
    assert_response :success
  end

  test "should get index_today" do
    login_as(@user, scope: :user)
    get index_today_path
    assert_response :success
  end

  test "should get index_urgent" do
    login_as(@user, scope: :user)
    get index_urgent_path
    assert_response :success
  end

  test "should get show" do
    login_as(@user, scope: :user)
    get post_path(@post)
    assert_response :success
  end

  #未ログイン時にページが開けないことを確認
  test "should redirect to login_form from index" do
    get index_path
    assert_not flash.empty?
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect to login_form from index_today" do
    get index_today_path
    assert_not flash.empty?
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect to login_form from index_urgent" do
    get index_urgent_path
    assert_not flash.empty?
    assert_redirected_to '/users/sign_in'
  end

  test "should redirect to login_form from show" do
    get post_path(@post)
    assert_not flash.empty?
    assert_redirected_to '/users/sign_in'
  end 

  #未ログイン時にリクエストが動作しないこと
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to '/users/sign_in'
  end
end