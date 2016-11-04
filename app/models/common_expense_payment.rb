class CommonExpensePayment < ActiveRecord::Base
  belongs_to :subunit
  belongs_to :renter
end
