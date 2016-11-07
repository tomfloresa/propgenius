class SubunitRent < ActiveRecord::Base
  has_one :rent_payment
  belongs_to :subunit
end
