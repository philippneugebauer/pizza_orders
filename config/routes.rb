Rails.application.routes.draw do
  resources :promotions, exclude: [:show]
  resources :pizza_sizes, exclude: [:show]
  resources :pizzas, exclude: [:show]
  resources :ingredients, exclude: [:show]
  resources :discounts, exclude: [:show]
  resources :orders

  root "orders#index"
end
