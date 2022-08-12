Rails.application.routes.draw do
  resources :promotions
  resources :pizza_sizes
  resources :pizzas
  resources :ingredients
  resources :discounts
  resources :orders

  root "orders#index"
end
