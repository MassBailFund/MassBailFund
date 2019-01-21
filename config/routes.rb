Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :settings
  devise_for :users
  resources :users, :controllers => { :registrations => 'registrations'} #except: :create

  resources :clients, only: [:new, :create]

  namespace :admin do
    match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user

    resources :clients, except: [:new, :create]
    #post 'create_user' => 'users#create', as: :create_user

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
