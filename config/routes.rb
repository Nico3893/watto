Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items, only: [ :new, :create, :edit, :update, :delete]
  resources :items, only: [ :index, :show ] do
    resources :bookings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'items/index', to: 'items#index'
end
