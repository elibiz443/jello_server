Rails.application.routes.draw do
  resources :comments
  resources :cards
  resources :lists
  resources :boards
  resources :users
end
