Rails.application.routes.draw do
  root "media#index"
  devise_for :users
  resources :media
  post "/modal", to: "media#modal"
  post "/search", to: "media#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
