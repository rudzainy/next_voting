Rails.application.routes.draw do

  namespace :admins do
    resources :statics, only: [:index]
    resources :teams
    resources :awards
  end


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  root "teams#index"
  resources :teams do
    resources :notes
  end
  resources :awards do
    resources :votes
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
