Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :movies, only: [:index]
      resources :seasons, only: [:index]
      resources :videos, only: [:index, :show] do
        post :purchase
      end
      resource :library, only: [:index]
    end
  end
end
