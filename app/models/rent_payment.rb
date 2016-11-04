class RentPayment < ActiveRecord::Base
  belongs_to :subunit
  belongs_to :renter
  belongs_to :subunit_rent_id
end
