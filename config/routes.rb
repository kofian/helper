Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :donations
  resources :pledges
  resources :carts
  resources :notes
  get 'charity/index'

  #resources :user, only: [:show, :edit, :update]
  get 'user/:id/profile' => 'user#profile', as: :profile
  get 'user/:id/project' => 'user#project', as: :user_project
  get 'user/:id/donation' => 'user#donation', as: :user_donation
  #get 'user' => 'user#index'


 # resources :projects do
   # get :who_donated, on: :member
 # end
  resources :projects, param: :slug do
    member do
     post 'like'
     get 'who_donated'
    end
  end

    namespace :api do
      namespace :v1 do
        resources :items, only: [:index, :create, :destroy, :update]
      end
    end

  namespace :admin do
   resources :users, except: [:new, :create]
   resources :projects, param: :slug, except: [:new, :create]
   resources :projects, only: [:archive, :unarchive] do
    post :archive
    post :unarchive
    post :faeture
    post :unfaeture
    post :watched
    post :unwatched
  end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
    root 'charity#index', as: 'charity'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
