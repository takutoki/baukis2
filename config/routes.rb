Rails.application.routes.draw do

  config = Rails.application.config.baukis2

  constraints host: config[:staff][:host] do
    namespace :staff, path: config[:staff][:path] do
      root "top#index"
      get "/login" => "sessions#new"
      resource :session, only: %i(create destroy)
      resource :account, except: %i(new create destroy)
    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root "top#index"
      get "/login" => "sessions#new"
      resource :session, only: %i(create destroy)
      resources :staff_members
    end
  end

  constraints host: config[:customer][:host] do
    namespace :customer, path: config[:customer][:path] do
      root "top#index"
    end
  end
end
