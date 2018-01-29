Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  namespace :admin do
    resources :goals
    resources :categories
    resources :users

  end

  authenticated :user do
    root to: 'admin/goals#index', as: :authenticated_root
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
