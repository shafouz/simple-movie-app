Rails.application.routes.draw do
  root "movies#index"
  get "/search", to: "movies#search"
  post "/search", to: "movies#search"
  resources :movies
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
