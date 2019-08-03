Rails.application.routes.draw do
  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      resources :movies, only: [:index]
      resources :seasons, only: [:index]
      resources :videos, only: [:index, :show]
      resources :purchases,  only: [:index, :show, :create]
    end
  end
end
