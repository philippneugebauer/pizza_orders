Rails.application.routes.draw do
  resources :pizzas
  resources :ingredients
  resources :discounts
  resources :orders

  root "orders#index"
end
