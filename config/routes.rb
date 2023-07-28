Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  resources :carts
  resources :products
  resources :testimonials
  resources :admins, only: [:create, :update, :destroy]
  resources :users
end
