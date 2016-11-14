class CommonExpenseProperty < ActiveRecord::Base
  belongs_to :property
  has_many :common_expense_subunits
end
