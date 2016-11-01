Rails.application.routes.draw do
  resources :subunit_rents
  resources :outcome_categories
  resources :outcome_categories
  root 'index#index'
  resources :outcomes
  resources :common_expense_subunits
  resources :common_expense_properties
  resources :subunits
  resources :outcomes
  resources :properties
  resources :property_types

  Rails.application.routes.draw do
  resources :subunit_rents
  resources :outcome_categories
  resources :outcome_categories
  resources :outcomes
      devise_for :renters, controllers: {
        sessions: 'renters/sessions',
        registrations: 'renters/registrations'
      }
    end
  Rails.application.routes.draw do
  resources :subunit_rents
  resources :outcome_categories
  resources :outcome_categories
  resources :subunits
      devise_for :administrators, controllers: {
        sessions: 'administrators/sessions',
        registrations: 'administrators/registrations'
      }
    end
  Rails.application.routes.draw do
  resources :subunit_rents
  resources :outcome_categories
      devise_for :owners, controllers: {
        sessions: 'owners/sessions',
        registrations: 'owners/registrations'
      }
    end

  scope path: '/index', controller: :index do
    get 'index' => 'index#index', :as => :index
  end

  scope path: '/administrators', controller: :administrators do
    get 'dashboard' => 'administrators#dashboard', :as => :administrators_dashboard
    get 'new_subunit_for_property/:property_id' => 'administrators#new_subunit_for_property', :as => :new_subunit_for_property
    get 'new_matrix_common_expese_property/:property_id' => 'administrators#new_matrix_common_expese_property', :as => :new_matrix_common_expese_property
    get 'rent_for_subunits/:property_id' => 'administrators#rent_for_subunits', :as => :rent_for_subunits
    post 'create_rent_for_subunits' => 'administrators#create_rent_for_subunits', :as => :create_rent_for_subunits
  end

  scope path: '/renters', controller: :renters do
    get 'dashboard' => 'renters#dashboard', :as => :renters_dashboard
    get 'index' => 'renters#index', :as => :renters_index
  end
end
