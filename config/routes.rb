Checkpoint::Application.routes.draw do

  root "homes#show"

  resource :dashboard, only: [:show]

  resources :goals do
    resources :steps, only: [:new, :create, :index]
  end

  resources :steps, only: [:edit, :update, :destroy]

  resources :athletes, only: [:index]

  resources :users, only: [:show] do
    member do # /users/:id
      post "/coach" => "coaching_relationships#create" # /users/:id/follow
      delete "/uncoach" => "coaching_relationships#destroy" # /users/:id/unfollow
    end
  end

end
