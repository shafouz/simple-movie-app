Rails.application.routes.draw do
  resources :media
  post "/modal", to: "media#modal"
  post "/search", to: "media#search"

  devise_for :users
  root "media#index"
end
