class CommonExpenseSubunit < ActiveRecord::Base
  belongs_to :subunit
  belongs_to :common_expense_property
  has_one :common_expense_payment
end
