Rails.application.routes.draw do
  resources :discounts
  resources :orders

  root "orders#index"
end
