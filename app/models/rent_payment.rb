class RentPayment < ActiveRecord::Base
  belongs_to :subunit
  belongs_to :renter
  belongs_to :subunit_rent
  belongs_to :payment_method
end
