require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  #deviseによるログイン
  include Warden::Test::Helpers

  # test "should redirect create when not logged in" do
  #   get 
  #   assert_difference 'Post.count', 1 do
  #     post posts_path, params: { posts: { urgency: 3, summary: "test!test!",
  #     detail: "this is test" } }
  #   end
  #   assert_redirected_to done_path
  # end

  #未ログイン時に管理者用機能が使えないこと
  # test "should redirect solve when not logged in" do
  #   post solved_path(@post)
  #   @post.done_flag == 0
  #   assert_redirected_to '/users/sign_in'
  # end

  #test "should redirect unsolve when not logged in" do
    #
  #end
end