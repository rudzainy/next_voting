Rails.application.routes.draw do



  namespace :admin do
    get 'awards/new'
  end

  namespace :admin do
    get 'awards/create'
  end

  namespace :admin do
    get 'awards/show'
  end

  namespace :admin do
    get 'awards/index'
  end

  namespace :admin do
    get 'awards/edit'
  end

  namespace :admin do
    get 'awards/update'
  end

  namespace :admin do
    get 'awards/destroy'
  end

  resources :notes
  namespace :admins do
    resources :statics, only: [:index]
    resources :teams
  end


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  root "home#welcome"
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
