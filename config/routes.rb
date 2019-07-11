Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :items do
    resources :bookings, only: [:new, :create]
  end
  post 'items/:id', to: 'bookings#create'
  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
