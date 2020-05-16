Rails.application.routes.draw do

  root :to => "sessions#new"

get '/signup', to: 'users#new'
get '/login', to: 'sessions#new'
post 'sessions', to: 'sessions#create'
delete 'sessions', to: 'sessions#destroy'

resources :customers
resources :cases
resources :users, only: [:create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
