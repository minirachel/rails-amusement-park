Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#hello'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  post '/rides' => 'rides#create'

  resources :users, only: [:new, :create, :show, :edit]

  resources :attractions, only:[:show, :index, :new, :create]
end
