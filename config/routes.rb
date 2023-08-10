Rails.application.routes.draw do

  resources :gallery_thumbnail, only: [:index]
  resources :high_resolution_image, only: [:index]
  resources :cart_items
  post '/login', to: 'auth#create'
  get '/auth',to: 'users#show'
  # delete '/logout',to: 'auth#destroy'
  resources :carts
  resources :products
  resources :testimonials
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
