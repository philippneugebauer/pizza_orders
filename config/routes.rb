Rails.application.routes.draw do
  resources :ingredients
  resources :discounts
  resources :orders

  root "orders#index"
end
