Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: [:new, :create, :index]
  resources :address
  resources :events, only: [:edit, :update, :destroy]
  match "users/signup" => "users#signup", as: :signup, via: [:post]
  match "homes/check_login" => "homes#check_login", as: :check_login, via: [:post]
  match "homes/login" => "homes#login", via: [:get]
  match "homes/logout" => "homes#logout", via: [:post]

  match "events/create_event" => "events#create_event", via: [:post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
