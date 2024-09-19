Rails.application.routes.draw do
  root "home#index"

  get "biber", to: "biber#index"
  get "woelfli", to: "woelfli#index"
  get "pfadi", to: "pfadi#index"
  get "pios", to: "pios#index"
  get "rover", to: "rover#index"

  get "verein", to: "verein#index"

  get "anmeldung", to: "anmeldung#new"
  post "anmeldung", to: "anmeldung#create"



  get "login", to: "log_in#new"
  post "login", to: "log_in#create"

  get "logout", to: "log_in#destroy"
  delete "logout", to: "log_in#destroy"

  get "leiter", to: "leiter#new"
  post "leiter", to: "leiter#create"
  get "profil", to: "leiter#show"
  get "profil/edit", to: "leiter#edit"
  patch "profil", to: "leiter#update"

  get "parent", to: "parent#new"
  post "parent", to: "parent#create"

  resources :kleiders
  resources :hocks


end
