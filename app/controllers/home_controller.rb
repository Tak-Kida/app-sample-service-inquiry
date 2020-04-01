class HomeController < ApplicationController
  #before_action :authenticate_user!, except: [:readme]

  def top
    @posts = Post.all.order(created_at: :desc)
  end

  def readme
  end
end
