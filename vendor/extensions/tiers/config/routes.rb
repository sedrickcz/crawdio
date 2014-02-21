Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :tiers do
    resources :tiers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :tiers, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :tiers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
