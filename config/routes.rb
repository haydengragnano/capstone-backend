Rails.application.routes.draw do
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  get "/tags" => "tags#index"

  get "/games" => "games#index"
  get "/games/:id" => "games#show"


  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
end
