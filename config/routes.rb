Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :seminars

  namespace :admin do
    resources :seminars
  end

    root 'seminars#index'
end
