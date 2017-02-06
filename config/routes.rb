Rails.application.routes.draw do
  resources :electricity_readings
  resources :water_readings
  resources :bank_account_types
  resources :comunes
  resources :important_numerical_values
  resources :banks
  root 'index#index'

  resources :payment_methods
  resources :common_expense_payments
  resources :rent_payments
  resources :subunit_rents
  resources :outcome_categories
  resources :outcomes do
    collection do
      get 'history_outcomes_property/:property_id' => 'outcomes#history_outcomes_property', :as => :history_outcomes_property
      post 'search_outcomes_property_by_period', :as => :search_outcomes_property_by_period
    end
  end
  resources :common_expense_subunits do
    collection do
      get 'check_if_common_expense_property_for_period_is_issued' => 'common_expense_subunits#check_if_common_expense_property_for_period_is_issued'
    end
  end
  resources :common_expense_properties do
    collection do
      get 'history_common_expenses_property/:property_id' => 'common_expense_properties#history_common_expenses_property', :as => :history_common_expenses_property
      post 'search_common_expense_property_by_period', :as => :search_common_expense_property_by_period
    end
  end
  resources :subunits
  resources :properties do
    collection do
      get 'register_water_readings_for_subunits' => 'properties#register_water_readings_for_subunits', :as => :register_water_readings_for_subunits
      post 'create_water_readings_for_subunits' => 'properties#create_water_readings_for_subunits', :as => :create_water_readings_for_subunits
      get 'register_electricity_readings_for_subunits' => 'properties#register_electricity_readings_for_subunits', :as => :register_electricity_readings_for_subunits
      post 'create_electricity_readings_for_subunits' => 'properties#create_electricity_readings_for_subunits', :as => :create_electricity_readings_for_subunits
    end
  end
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
    get 'test_pdf_rent_charge' => 'administrators#test_pdf_rent_charge', :as => :test_pdf_rent_charge
    get 'test_pdf_common_expense_charge' => 'administrators#test_pdf_common_expense_charge', :as => :test_pdf_common_expense_charge
    get 'search_rent_charge', :as => :search_rent_charge
    get 'search_common_expense_subunit', :as => :search_common_expense_subunit
    post 'search_id_for_rent_charge' => 'administrators#search_id_for_rent_charge', :as => :search_id_for_rent_charge
    post 'search_id_for_common_expense_subunit' => 'administrators#search_id_for_common_expense_subunit', :as => :search_id_for_common_expense_subunit
  end

  scope path: '/renters', controller: :renters do
    get 'dashboard' => 'renters#dashboard', :as => :renters_dashboard
    get 'index' => 'renters#index', :as => :renters_index
    get 'subunits_for_renter', :as => :subunits_for_renter
    get 'properties_for_renter', :as => :properties_for_renter
  end
end
