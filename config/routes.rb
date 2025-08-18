Rails.application.routes.draw do
  resources :messages, only: [:index, :create]

  # Optional alias (but not needed since resources already give /messages)
  post "/message", to: "messages#create"
  get "/message", to: "messages#index"

  # User signup (registration)
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  # User login/logout (sessions)
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Root
  root "welcome#index"
end
