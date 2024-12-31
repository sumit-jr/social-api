Rails.application.routes.draw do
  resources :users, only: [ :create, :index ]
  resources :posts, only: [ :create ]
  post "/auth", to: "authentication#login"
  # root "posts#index"
end
