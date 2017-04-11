Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :case_details, only: [:new, :create]

  root to: 'home#index'
end
