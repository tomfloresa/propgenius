class CommonExpenseSubunit < ActiveRecord::Base
  belongs_to :subunit
  has_one :common_expense_payment
end
