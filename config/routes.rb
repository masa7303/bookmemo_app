Rails.application.routes.draw do
  resources :contacts, :only => [:new, :create]
  #get 'contacts/new'
  #get 'contacts/create'
  resources :books do
    resources :comments, :only => [:create, :destroy]
  end

  resources :comments, :only => [:index]
  root 'top#index'
  get 'about/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
