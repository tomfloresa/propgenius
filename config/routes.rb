Rails.application.routes.draw do
  resources :important_numerical_values
  resources :banks
  root 'index#index'

  resources :payment_methods
  resources :common_expense_payments
  resources :rent_payments
  resources :subunit_rents
  resources :outcome_categories
  resources :outcomes
  resources :common_expense_subunits
  resources :common_expense_properties do
    collection do
      get 'history_common_expenses_property/:property_id' => 'common_expense_properties#history_common_expenses_property', :as => :history_common_expenses_property
    end
  end
  resources :subunits
  resources :properties
  resources :property_types

  devise_for :renters, controllers: {
    sessions: 'renters/sessions',
    registrations: 'renters/registrations'
  }
  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions',
    registrations: 'administrators/registrations'
  }
  devise_for :owners, controllers: {
    sessions: 'owners/sessions',
    registrations: 'owners/registrations'
  }

  scope path: '/index', controller: :index do
    get 'index' => 'index#index', :as => :index
  end

  scope path: '/administrators', controller: :administrators do
    get 'dashboard' => 'administrators#dashboard', :as => :administrators_dashboard
    get 'new_subunit_for_property/:property_id' => 'administrators#new_subunit_for_property', :as => :new_subunit_for_property
    get 'new_matrix_common_expense_property/:property_id' => 'administrators#new_matrix_common_expense_property', :as => :new_matrix_common_expense_property
    get 'rent_for_subunits/:property_id' => 'administrators#rent_for_subunits', :as => :rent_for_subunits
    post 'create_rent_for_subunits' => 'administrators#create_rent_for_subunits', :as => :create_rent_for_subunits
    get 'renter_profile/:renter_id' => 'administrators#renter_profile', :as => :renter_profile
  end

  scope path: '/renters', controller: :renters do
    get 'dashboard' => 'renters#dashboard', :as => :renters_dashboard
    get 'index' => 'renters#index', :as => :renters_index
  end
end
