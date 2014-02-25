Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :user_histories do
    resources :user_histories, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :user_histories, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :user_histories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
