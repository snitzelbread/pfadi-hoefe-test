Rails.application.routes.draw do
  get "anmeldung/new"
  get "anmeldung/create"
  get "verein/index"
  get "rover", to: "rover#index"
  get "pios", to: "pios#index"
  get "pfadi", to: "pfadi#index"
  get "woelfli", to: "woelfli#index"
  get "biber", to: "biber#index"

  get "login", to: "log_in#new"
  post "login", to: "log_in#create"

  get "logout", to: "log_in#destroy"
  delete "logout", to: "log_in#destroy"

  root "home#index"

  get "leiter", to: "leiter#new"
  post "leiter", to: "leiter#create"

  resources :hocks


end
