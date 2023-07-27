Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  # get 'sessions#me'
  delete '/logout',to: 'sessions#destroy'
  resources :carts
  resources :products
  resources :testimonials
  resources :admins
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
