Rails.application.routes.draw do
  match '*path', to: 'application#handle_options_request', via: :options


  # User signup (registration)
  get "/users", to: "users#index"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  # User login/logout (sessions)
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Root
  root "welcome#index"
end
