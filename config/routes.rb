Rails.application.routes.draw do
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
