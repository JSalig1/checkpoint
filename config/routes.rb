Checkpoint::Application.routes.draw do

  root "homes#show"

  resource :dashboard, only: [:show]

  resources :goals, except: [:edit] do
    resources :steps, only: [:new, :create, :index]
  end

  resources :steps, only: [:edit, :update, :destroy]

end
