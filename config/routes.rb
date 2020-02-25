Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :contacts, :only => [:new, :create]

  resources :users do
    resources :books, :only => [:index]
  end

  resources :books do
    resources :comments, :only => [:create, :destroy]
  end

  #resources :comments, :only => [:index]
  root 'top#index'
  get 'about/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'comments/index'

  # twitterログイン
  get '/auth/:provider/callback' => 'sessions#create'

  # ログアウト
  get '/signout' => 'sessions#destroy'

  # テストユーザー
  get '/testlogin' => 'sessions#testuser'

  # お気に入りボタン
  post '/likes/:id' => 'likes#likes?'
  post '/likes/:id/like' => 'likes#like'

end
