Rails.application.routes.draw do
  resources :media
  root "media#index"
  post "/search", to: "media#search"
  get "/test", to: "media#test"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
