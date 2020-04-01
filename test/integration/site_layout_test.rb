require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'home/top'
    #assert_select "a[href=?]", index_path
    #assert_select "a[href=?]", index_today_path
    #assert_select "a[href=?]", index_urgent_path
    #assert_select "a[href=?]", new_path
    assert_select "a[href=?]", logout_path

    get readme_path
    assert_template 'home/readme'
    assert_select "a[href=?]", login_path

    #get signup_path
    #assert_select "title", full_title("Sign up")
  end
end
