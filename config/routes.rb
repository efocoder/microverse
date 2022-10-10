Rails.application.routes.draw do
  devise_for :accounts
  resources :users, only: [:index, :show]
  root "users#index"
end
