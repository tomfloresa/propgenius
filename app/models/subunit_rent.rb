class SubunitRent < ActiveRecord::Base
  has_one :rent_payment
end
