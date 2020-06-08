Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   ,
  :omniauth_callbacks => 'users/omniauth_callbacks'
  } 
  devise_scope :user do
    get 'user/:id',     to: 'users/registrations#detail'
    get 'signup',       to: 'users/registrations#new'
    get 'login',        to: 'users/sessions#new'
    get 'logout',       to: 'users/sessions#destroy'
  end

  resources :form
  #HomeController
  root 'home#top'
  get '/top',           to: 'home#top'
  get '/readme',        to: 'home#readme'

  #PostsController
  get '/new',           to: 'posts#new'
  post '/create',       to: 'posts#create'
  post '/confirm',      to: 'posts#confirm'
  get '/done',          to: 'posts#done'
  get '/index',         to: 'posts#index'
  get '/index_urgent',  to: 'posts#index_urgent'
  get '/index_today',   to: 'posts#index_today'
  get 'posts/:id',           to: 'posts#show'
  post 'posts/:id/solved',   to: 'posts#solved'
  post 'posts/:id/unsolved', to: 'posts#unsolved'
  get 'posts/:id/update',    to: 'posts#update'
  post 'posts/:id/edit',     to: 'posts#edit'
  resources :posts, only: [:create, :destroy]
end
