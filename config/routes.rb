Rails.application.routes.draw do
  root to: 'users#index'
  resources :listings
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/my-feed', to: 'pages#feed'
  get '/categories/:id', to: 'categories#show'
  post "/follow_category/:user_id/:category_id", to: 'follows#follow_category'
  delete "/unfollow_category/:user_id/:category_id", to: 'follows#unfollow_category'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
