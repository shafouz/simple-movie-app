Rails.application.routes.draw do
  resources :media
  root "media#index"
  post "/search", to: "media#search"
  post "/select_search", to: "media#select_search"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
