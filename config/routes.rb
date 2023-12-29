Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # itemsに関するルーティングresources :items
  resources :items, only: [:new, :create]
end
