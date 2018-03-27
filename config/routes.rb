Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, :controllers => {registrations: 'registrations'}

  namespace :admin do
    resources :goals
    resources :categories
    resources :users
    resources :ledgers

    get 'home/index'

    # Charts JSON APIs
    get 'charts/goal/:id/logs', to: 'charts#goal_logs', as: 'charts_goal_logs'
  end

  authenticated :user do
    root to: 'admin/home#index', as: :authenticated_root
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
