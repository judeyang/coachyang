Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :seminars do
    resources :bookings
  end

  namespace :admin do
    resources :products
    resources :seminars do
      member do
        post :publish
        post :hide
      end
      resources :bookings
    end
  end

  resources :products

    root 'seminars#index'
end
