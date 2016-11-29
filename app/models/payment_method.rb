class PaymentMethod < ActiveRecord::Base
  has_many :rent_payments
end
