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

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  post '/likes/:id' => 'likes#like'
end
