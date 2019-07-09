Rails.application.routes.draw do
  resources :books do
    resources :comments, :only => [:create, :destroy]
  end

  root 'top#index'
  get 'about/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
