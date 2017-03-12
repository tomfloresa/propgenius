class PaymentMethod < ActiveRecord::Base
  has_many :rent_payments
  has_many :common_expense_payments
end
