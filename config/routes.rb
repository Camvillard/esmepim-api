Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users
      resources :products, only: [ :index ]
      resources :orders
    end
  end

end
