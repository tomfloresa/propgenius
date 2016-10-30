class Property < ActiveRecord::Base
  belongs_to :owner
  belongs_to :renter
  belongs_to :property_type
  has_many :subunits
  has_many :common_expense_properties
  has_many :outcomes
end
