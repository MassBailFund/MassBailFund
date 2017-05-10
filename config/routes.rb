Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :clients, only: [:new, :create]

  namespace :admin do
    resources :attachments, only: :show
  end

  root to: 'home#index'
end
