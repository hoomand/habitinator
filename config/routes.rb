Rails.application.routes.draw do
  root "goals#index"

  namespace :admin do
    resources :goals
    resources :categories
    resources :users
  end

  resources :goals
  resources :categories
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
