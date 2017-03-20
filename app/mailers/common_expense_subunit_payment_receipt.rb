class CommonExpenseSubunitPaymentReceipt < ApplicationMailer
  default from: "hola@valprop.propgenius.cl"

  def common_expense_subunit_receipt_generated(common_expense_payment, common_expense_subunit, renter, subunit, property, qrcode, pdf_string)
    @common_expense_payment = common_expense_payment
    @common_expense_subunit = common_expense_subunit
    @renter = renter
    @subunit = subunit
    @property = property
    @pdf_string = pdf_string
    @qrcode = qrcode

    attachments["ReciboPagoGastoComun.pdf"] = WickedPdf.new.pdf_from_string(pdf_string)
    mail(to: @renter.email, subject: "Pago Gasto Común mes de #{@common_expense_payment.common_expense_subunit.period}")
  end
end
