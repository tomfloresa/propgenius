class Subunit < ActiveRecord::Base
  belongs_to :owner
  belongs_to :renter
  belongs_to :property
  belongs_to :property_type
  has_many :common_expense_subunits
end
