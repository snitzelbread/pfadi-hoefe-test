Rails.application.routes.draw do
  devise_for :leaders, controllers: {
    sessions: "leaders/sessions",
    registrations: "leaders/registrations",
    passwords: "leaders/passwords"
  }

  devise_scope :leader do
    get "profil", to: "leaders/registrations#show"
    get "forgot_password", to: "leaders/passwords#new"
    get "login", to: "leaders/sessions#new"
    get "change_password", to: "leaders/passwords#edit"
  end

  root "home#index"

  get "hockzettel", to: "hockzettel#index"

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

  get "wola", to: "wola#index"
  get "pfila", to: "pfila#index"
  get "sola", to: "sola#index"


  get "bestellung", to: "bestellung#new"
  post "bestellung", to: "bestellung#create"

  resources :kleiders do
    post "add_to_list", on: :member
  end

  delete "clear_shopping_list", to: "kleiders#clear_shopping_list", as: :clear_shopping_list
  get "checkout", to: "kleiders#checkout"

  resources :hocks
  resources :archives, except: [ :show, :new, :create ]
  resources :articles
  get "article/list", to: "articles#list"
  resources :news
  resources :camps, except: [ :show, :destroy ]
  resources :sponsors, except: [ :show ]

  get "sponsors/show_all", to: "sponsors#show_all"
  delete "sponsors/destroy/:id", to: "sponsors#destroy", as: :sponsors_destroy
end
