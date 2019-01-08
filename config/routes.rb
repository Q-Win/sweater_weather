Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecast#index'
      post 'users', to: 'users#create'
      get 'gifs', to: 'gifs#index'
      post 'sessions', to: 'sessions#create'
      post 'favorites', to: 'favorites#create'
      get 'favorites', to: 'favorites#index'
    end
  end

end
