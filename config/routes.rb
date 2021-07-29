Rails.application.routes.draw do
  resources :users
  resources :photos
  resources :albums

  # custom routes for seesions -> login , singup and logout
  get "/login", to: "sessions#login"
  post "/login", to: "sessions#login_session"
  get "/signup", to: "sessions#signup"
  post "/signup", to: "sessions#signup_session"
  delete "/logout", to: "sessions#logout"

  # cutom routes to return all users connections in a new view
  get "/followers/:profile", to: "users#followers"
  get "/follow/:profile", to: "users#follow"
  get "/:user", to: "users#profile"

  root "users#index"
end
