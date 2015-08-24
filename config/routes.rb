Rails.application.routes.draw do

  root 'registered_applications#index'

  resources :registered_applications do
    resources :events, only: [:create]
  end

  devise_for :users

end