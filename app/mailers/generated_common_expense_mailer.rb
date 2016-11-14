class GeneratedCommonExpenseMailer < ApplicationMailer
  default from: "hola@valprop.propgenius.cl"

  def generated_common_expense(renter, pdf_string, common_expense_property)
    @renter = renter
    @common_expense_property = common_expense_property

    attachments["GastoComun.pdf"] = WickedPdf.new.pdf_from_string(pdf_string)
    mail(to: @renter.email, subject: "Gasto Común")
  end
end
