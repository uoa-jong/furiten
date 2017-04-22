Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do 
  	resources :games, only: [:create, :destroy, :edit, :new, :update, :show]
  end

  resources :sessions

   root to: "sessions#new"
end
