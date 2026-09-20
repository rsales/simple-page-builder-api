Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  scope "/api" do
    resources :projects, only: [ :index, :show, :create, :update, :destroy ]

    get    "/schemas/:project_id",          to: "schemas#index"
    post   "/schemas/:project_id",          to: "schemas#create"
    get    "/schemas/:project_id/:id",      to: "schemas#show"
    put    "/schemas/:project_id/:id",      to: "schemas#update"
    delete "/schemas/:project_id/:id",      to: "schemas#destroy"

    get    "/pages/:project_id",       to: "pages#index"
    post   "/pages/:project_id",       to: "pages#create"
    get    "/pages/:project_id/:id",   to: "pages#show"
    put    "/pages/:project_id/:id",   to: "pages#update"
    delete "/pages/:project_id/:id",   to: "pages#destroy"
  end
end
