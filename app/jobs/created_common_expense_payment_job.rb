class CreatedCommonExpensePaymentJob < ActiveJob::Base
  queue_as :default

  def perform(common_expense_payment, common_expense_subunit, renter, subunit, property, qrcode, pdf_string)
    @common_expense_payment = common_expense_payment
    @common_expense_subunit = common_expense_subunit
    @renter = renter
    @subunit = subunit
    @property = property
    @pdf_string = pdf_string
    @qrcode = qrcode

    CommonExpenseSubunitPaymentReceipt.common_expense_subunit_receipt_generated(@common_expense_payment, @common_expense_subunit, @renter, @subunit, @property, @qrcode, @pdf_string).deliver_later
  end
end
