Rails.application.routes.draw do
  devise_for :users
  resources :media
  root "media#index"
  post "/search", to: "media#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
