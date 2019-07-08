Rails.application.routes.draw do
  resources :users, only: [ :new, :create ] do
    resources :items, only: [ :new, :create ]
    resources :bookings, only: [ :index, :edit, :update ]
  end
  resources :items, only: [ :show, :index ] do
    resources :bookings, only: [ :new, :create ]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
