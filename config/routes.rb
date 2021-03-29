Rails.application.routes.draw do
  resources :media
  get "/home", to: "media#home"
  post "/modal", to: "media#modal"
  post "/search", to: "media#search"

  devise_for :users
  root to: "media#home"
end
