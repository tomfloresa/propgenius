class CommonExpensePayment < ActiveRecord::Base
  belongs_to :subunit
  belongs_to :renter
  belongs_to :common_expense_subunit
end
