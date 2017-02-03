class CommonExpenseSubunit < ActiveRecord::Base
  belongs_to :subunit
  belongs_to :common_expense_property
  has_one :common_expense_payment

  has_attached_file :receipt
  validates_attachment_content_type :receipt, content_type: ['application/pdf']

  def get_grand_total
    self.electricity_charge +
    self.water_charge +
    self.gas_charge +
    self.others_charge
    self.maintenance_payments +
    self.salary_payments
  end
end
