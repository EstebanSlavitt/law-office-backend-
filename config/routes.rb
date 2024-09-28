Rails.application.routes.draw do
  post "/lawyer" => "lawyers#create"
  get "/lawyer" => "lawyers#index"
  get "/lawyer/:id" => "lawyers#show"
  patch "/lawyer/:id" => "lawyers#update"
  get "up" => "rails/health#show", as: :rails_health_check
end
