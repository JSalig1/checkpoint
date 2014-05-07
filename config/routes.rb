Checkpoint::Application.routes.draw do

  root "homes#show"

  resource :dashboard, only: [:show]

  resources :goals do
    resources :steps, only: [:new, :create, :index]
  end

  resources :steps, only: [:edit, :update, :destroy]

  resources :athletes, only: [:index]

  resources :users, only: [:show]

end
