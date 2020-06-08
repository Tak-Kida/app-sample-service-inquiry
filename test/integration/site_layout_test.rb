require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  #deviseによるログイン
  include Warden::Test::Helpers

  def setup
    @user = users(:demo)
  end

  test "layout links" do
    login_as(@user, scope: :user)
    get root_path
    assert_template 'home/top'
    assert_select "a[href=?]", index_path
    assert_select "a[href=?]", index_today_path
    assert_select "a[href=?]", index_urgent_path
    #投稿の詳細へのリンクが表示されること
    assert_select "a[href=?]", new_path
    assert_select "a[href=?]", destroy_user_session_path

    get readme_path
    assert_template 'home/readme'
    assert_select "a[href=?]", login_path

    get index_path
    assert_template 'posts/index'
    assert_select "a[href=?]", top_path
    #投稿一覧が表示されていること
    #投稿の詳細へのリンクが表示されること

    get index_today_path
    assert_template 'posts/index_today'
    assert_select "a[href=?]", top_path
    #投稿一覧が表示されていること
    #投稿の詳細へのリンクが表示されること

    get index_urgent_path
    assert_template 'posts/index_urgent'
    assert_select "a[href=?]", top_path
    #投稿一覧が表示されていること
    #投稿の詳細へのリンクが表示されること
  end
end
