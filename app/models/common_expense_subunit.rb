class CommonExpenseSubunit < ActiveRecord::Base
  belongs_to :subunit
  belongs_to :common_expense_property
  has_one :common_expense_payment

  has_attached_file :receipt
  validates_attachment_content_type :receipt, content_type: ['application/pdf']
end
