Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check

  root "static_pages#home"

  # Profile routes — inline editing via Turbo Frames
  get  "/profile",      to: "users#profile",        as: :profile
  get  "/profile/edit", to: "users#edit_profile",   as: :edit_profile
  patch "/profile",     to: "users#update_profile", as: :update_profile

  get "/about",   to: "static_pages#about"
  get "/tos",     to: "static_pages#terms"
  get "/privacy", to: "static_pages#privacy"

  resources :users
  resources :wallets
end
