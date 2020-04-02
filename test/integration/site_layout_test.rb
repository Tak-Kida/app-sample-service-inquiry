require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
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

    #get show_path
    #assert_template 'posts/1'
    #投稿の詳細が正しく表示されること

    get new_path
    assert_template 'posts/new'
    #投稿入力欄が表示されていること
    #投稿の送信ボタンが表示されること

    #get confirm_path
    #assert_template 'posts/confirm'
    #投稿入力欄が表示されていること
    #投稿の送信ボタンが表示されること
    #戻る(投稿の破棄)ボタンが表示されること

    get done_path
    assert_template 'posts/done'
    #投稿入力欄が表示されていること
    #投稿の送信リンクが表示されること

    get login_path
    assert_template 'users/sessions/new'
    #ログインフォームが存在すること
    assert_select "a[href=?]", readme_path
  end
end
