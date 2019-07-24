Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :contacts, :only => [:new, :create]
  #get 'contacts/new'
  #get 'contacts/create'
  resources :books do
    resources :comments, :only => [:create, :destroy]
  end

  #resources :comments, :only => [:index]
  root 'top#index'
  get 'about/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'comments/index'

  get '/auth/:provider/callback' => 'users#create'
  get '/signout' => 'users#destroy'
end
