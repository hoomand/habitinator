Rails.application.routes.draw do
  namespace :admin do
    get 'goals/index'
  end

  namespace :admin do
    get 'goals/show'
  end

  namespace :admin do
    get 'goals/edit'
  end

  namespace :admin do
    get 'goals/update'
  end

  namespace :admin do
    get 'goals/delete'
  end

  namespace :admin do
    get 'categories/index'
  end

  namespace :admin do
    get 'categories/show'
  end

  namespace :admin do
    get 'categories/edit'
  end

  namespace :admin do
    get 'categories/update'
  end

  namespace :admin do
    get 'categories/delete'
  end

  namespace :admin do
    get 'users/index'
  end

  namespace :admin do
    get 'users/show'
  end

  namespace :admin do
    get 'users/edit'
  end

  namespace :admin do
    get 'users/update'
  end

  namespace :admin do
    get 'users/delete'
  end

  get 'goals/index'

  get 'goals/show'

  get 'goals/edit'

  get 'goals/update'

  get 'goals/delete'

  get 'categories/index'

  get 'categories/show'

  get 'categories/edit'

  get 'categories/update'

  get 'categories/delete'

  get 'users/show'

  get 'users/edit'

  get 'users/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
