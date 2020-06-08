require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  #deviseによるログイン
  include Warden::Test::Helpers

  def setup
    @user = users(:demo)
  end

  #管理者向けページがログイン時に開くことを確認
  test "should get top" do
    login_as(@user, scope: :user)
    get root_path
    assert_response :success
  end

  test "should get readme" do
    login_as(@user, scope: :user)
    get readme_path
    assert_response :success
  end

  #未ログイン時にページが開けないことを確認
  test "should redirect to login_form from top" do
    get root_path
    assert_not flash.empty?
    assert_redirected_to '/users/sign_in'
  end
end
