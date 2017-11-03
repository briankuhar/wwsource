Rails.application.routes.draw do
  resources :projects
  resources :profiles

  delete 'avatar/:id' => 'profiles#remove_image', as: :avatar

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#main'
end
