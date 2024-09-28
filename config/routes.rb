Rails.application.routes.draw do
  resources :lawyers

  get "up" => "rails/health#show", as: :rails_health_check
  get "/lawyer" => "lawyer#index"
end
