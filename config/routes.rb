Rails.application.routes.draw do
  # get 'profiles/update'

  # get 'profiles/edit', as: 'profile'

  # get 'profiles/index'

  # get 'profiles/show'
  
  resources :profiles

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#main'
end
