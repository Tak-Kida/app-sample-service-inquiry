class PostsController < ApplicationController
  before_action :current_user
  before_action :authenticate_user!, {only:
    [:index, :index_today, :index_urgent, :solved, :unsolved, :destroy, :show, :edit, :update]}
   
  def new
    @post = Post.new
  end
  
  def confirm
    @post = Post.new(
      urgency: params[:urgency],
      summary: params[:summary],
      detail: params[:detail])
    render("/posts/new") if @post.invalid?
  end
  
  def create
    @post = Post.new(
      urgency: params[:urgency],
      summary: params[:summary],
      detail: params[:detail])
    @post.save
    redirect_to("/done")
  end
  
  def done
    @post = Post.find_by(id: params[:id])
  end
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def index_today
    @posts = Post.where(created_at: Time.zone.now.all_day).order(created_at: :desc)
  end
  
  def index_urgent
    @posts = Post.where(urgency: 3).where(done_flag: 0).order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def solved
    @post = Post.find_by(id: params[:id])
    @post.done_flag = true
    @post.save
    redirect_to("/posts/#{params[:id]}")
  end
  
  def unsolved
    @post = Post.find_by(id: params[:id])
    @post.done_flag = false
    @post.save
    redirect_to("/posts/#{params[:id]}")
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to(index_path)
  end
  
  def update
    @post = Post.find_by(id: params[:id])
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
    @post.deal_with_policy = params[:deal_with_policy]
    @post.deal_with_detail = params[:deal_with_detail]
    @post.save
    redirect_to("/posts/#{params[:id]}")
  end
end
