Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :games, only: [:index,:create, :destroy, :edit, :new, :update, :show]

  resources :sessions

  resources :ranks, only: [:index,:create]

   root to: "sessions#new"
end
