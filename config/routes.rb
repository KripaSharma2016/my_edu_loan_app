Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'loans#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end

  resources :loans, only: [:index, :new, :create]
  resources :emis, only: [:index]
end
