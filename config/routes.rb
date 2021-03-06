Rails.application.routes.draw do
  resources :users, except: [:index]
  resources :games, only: [:index]
  resource :session, only: [:new, :create, :destroy]
end
