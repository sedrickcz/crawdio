Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :orders do
    resources :orders, :path => '', :only => [:index, :show, :new, :create] do 
      post :process_order, on: :collection
      get :thank_you, on: :collection
    end
  end

  # Admin routes
  namespace :orders, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :orders do
        collection do
          post :update_positions
        end
      end
    end
  end

end
