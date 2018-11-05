Rails.application.routes.draw do
  resources :settings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :clients, only: [:new, :create]

  namespace :admin do
    match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user
    resources :clients, except: [:new, :create]
    resources :attachments, only: :show
    resources :reports do
      collection do
        get 'sureties'
        get 'clients_by_month'
        get 'clients_by_year'
        get 'clients_for_year'
      end
    end
  end

  root to: 'home#index'
end
