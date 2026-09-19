Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  scope "/api" do
    resources :projects, only: [ :index, :show, :create, :update, :destroy ]
  end
end
