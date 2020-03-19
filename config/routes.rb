Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   ,
  :omniauth_callbacks => 'users/omniauth_callbacks'
  } 
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  resources :form
  root 'home#top'
  #トップページをhomeコントローラのtopアクションに設定
  get 'home/test' => "home#test"
  get 'home/top' => "home#top"
  get 'home/readme' => "home#readme"
  get '/' => "home#top"

  get 'posts/test' => "posts#test"
  get 'posts/new' => "posts#new"
  post 'posts/create' => "posts#create"
  post 'posts/confirm' => "posts#confirm"
  get 'posts/done' => "posts#done"
  get 'posts/index' => "posts#index"
  get 'posts/index_urgent' => "posts#index_urgent"
  get 'posts/index_today' => "posts#index_today"
  get 'posts/:id' => "posts#show"
  post 'posts/:id/solved' => "posts#solved"
  post 'posts/:id/unsolved' => "posts#unsolved"
  get 'posts/:id/update' => "posts#update"
  post 'posts/:id/edit' => "posts#edit"
  resources :posts, only: [:destroy]
end
