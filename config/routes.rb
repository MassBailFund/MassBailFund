Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :clients, only: [:new, :create]

  namespace :admin do
    resources :clients, except: [:new, :create]
    resources :attachments, only: :show
    resources :reports do
      collection do
        get 'sureties'

      end
      collection do
        get 'clients_by_month'
      end
    end
  end

  root to: 'home#index'
end
