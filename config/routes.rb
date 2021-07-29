Rails.application.routes.draw do
  resources :users
  resources :albums do
    resources :photos
  end

  root "users#index"
end
