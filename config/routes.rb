Checkpoint::Application.routes.draw do

  root "homes#show"

  resource :dashboard, only: [:show]

  resources :goals do
    resources :steps, only: [:new, :create, :index]
    resources :review_requests, only: [:new, :create]
  end

  resources :steps, only: [:edit, :update, :destroy]

  resources :athletes, only: [:index]

  resources :users, only: [:show] do
    member do
      post "/coach" => "coaching_relationships#create"
      delete "/stopcoach" => "coaching_relationships#destroy"
    end
  end

end
