class GeneratedCommonExpenseMailer < ApplicationMailer
  default from: "hola@valprop.propgenius.cl"

  def generated_common_expense(renter)
    @renter = renter
    mail(to: @renter.email, subject: "Generación Gasto Común")
  end
end
