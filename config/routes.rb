Rails.application.routes.draw do
  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      resources :videos, only: [:index, :show]
      get :movies, to: 'videos#index', defaults: { type: 'Movie' }
      get :seasons, to: 'videos#index', defaults: { type: 'Season' }
      resources :purchases,  only: [:index, :show, :create]
    end
  end
end
