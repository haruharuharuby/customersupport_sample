Rails.application.routes.draw do

  resources :products
  resources :estimations
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :csps, controllers: {
    sessions: 'csps/sessions',
    registrations: 'csps/registrations',
    passwords: 'csps/passwords',
    confirmations: 'csps/confirmations'
  }

  authenticated :csp do
    root "announcements#index", as: :authenticated_csp_root
  end
  root to: "landings#index"

  resources :orders, only: [:new, :create, :top, :complete], concerns: :confirmable do
    resource :questionnaire, only: [:new, :create]

    collection do
      get 'top'
    end

    member do
      get 'complete'
    end
  end

  resources :nurseries, concerns: :searchable
  resources :organizations
  resources :csps
  resources :billings, except:[:index]
  resources :sending_objects
  resources :announcements
  resources :contacts

  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
