Rails.application.routes.draw do
  resources :users
  resources :photos
  resources :albums

  # custom routes for seesions -> login , singup and logout
  get "/login", to: "sessions#login"
  post "/login", to: "sessions#login_session"
  get "/signup", to: "sessions#signup"
  post "/login", to: "sessions#signup_session"
  delete "/logout", to: "sessions#logout"

  # cutome routes to return all users connections in a new view
  get "/followers", to: "users#followers"
  get "/following", to: "users#following"

  root "users#index"
end
