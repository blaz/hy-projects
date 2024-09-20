Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "projects#index"

  resources :projects, only: %i[index show] do
    resource :comments, as: :project_comments, controller: :project_comments, only: %i[create]

    member do 
      post :update_status
    end
  end
end
