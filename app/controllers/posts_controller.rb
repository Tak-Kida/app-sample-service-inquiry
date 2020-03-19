class PostsController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user, {only:
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
        detail: params[:detail]
      )
      @post.save
      redirect_to("/posts/done")
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
      @posts = Post.where(urgency: 3).where(done: 0).order(created_at: :desc)
    end
  
    def show
      @post = Post.find_by(id: params[:id])
    end
  
    def solved
      @post = Post.find_by(id: params[:id])
      @post.done = true
      @post.save
      redirect_to("/posts/#{params[:id]}")
    end
  
    def unsolved
      @post = Post.find_by(id: params[:id])
      @post.done = false
      @post.save
      redirect_to("/posts/#{params[:id]}")
    end
  
    def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
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
  
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
  
    def authenticate_user
      if @current_user == nil
        flash[:notice] = "ログインが必要です"
        redirect_to("/users/login_form")
      end
    end
  
  end