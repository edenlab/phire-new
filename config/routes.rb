Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :photos, only: [:index]

  resources :photographers, only: [:show] do
    resource :portfolio, only: [:show]

    resources :bookings, only: [:new, :create]
  end

  resource :profile, only: [:show, :edit, :update]

  namespace :profile do
    resources :photos
    resources :bookings, only: [:index]

    resources :gigs, only: [:index] do
      member do
        patch :accept
        patch :decline
      end
    end
  end
end
