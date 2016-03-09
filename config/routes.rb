Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :photos, only: [:index]

  resources :photographers, only: [:show] do
    resource :portfolio, only: [:show]

    resources :bookings, only: [:new, :create]
  end

  resource :profile, only: [:show, :edit, :update, :delete]

  namespace :profile do
    resources :photos, only: [:new, :create, :index]
    resources :bookings, only: [:index]

    resources :gigs, only: [:index] do
      member do
        patch :accept
        patch :decline
      end
    end
  end
end
