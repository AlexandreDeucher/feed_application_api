Rails.application.routes.draw do
  resources :publications
  mount_devise_token_auth_for 'User', at: 'auth'
  resource :user, only: :update
  get '/comments/:id', to: 'comments#show'
  get '/comments/', to: 'comments#index'
  put '/comments/:id', to: 'comments#update'
  delete '/comments/:id', to: 'comments#destroy' 
  post '/comments/', to: 'comments#create'


  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
