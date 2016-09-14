Rails.application.routes.draw do
  resources :subunits
  root 'index#index'

  resources :properties
  resources :property_types

  Rails.application.routes.draw do
  resources :subunits
      devise_for :renters, controllers: {
        sessions: 'renters/sessions',
        registrations: 'renters/registrations'
      }
    end
  Rails.application.routes.draw do
  resources :subunits
      devise_for :administrators, controllers: {
        sessions: 'administrators/sessions',
        registrations: 'administrators/registrations'
      }
    end
  Rails.application.routes.draw do
  resources :subunits
      devise_for :owners, controllers: {
        sessions: 'owners/sessions',
        registrations: 'owners/registrations'
      }
    end

scope path: '/index', controller: :index do
  get 'index' => 'index#index', :as => :index
  get 'new_subunit_for_property/:property_id' => 'index#new_subunit_for_property', :as => :new_subunit_for_property
end

scope path: '/administrators', controller: :administrators do
  get 'dashboard' => 'administrators#dashboard', :as => :administrators_dashboard
end

scope path: '/renters', controller: :renters do
  get 'dashboard' => 'renters#dashboard', :as => :renters_dashboard
end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
