Rails.application.routes.draw do

  root 'registered_applications#index'

  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    # OPTION is an HTTP verb
    match '/events', to: 'events#index', via: [:options]
    resources :events, only: [:create]
  end

  devise_for :users

end