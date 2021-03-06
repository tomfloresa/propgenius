class CreatedRentCharge < ApplicationMailer
  default from: "hola@valprop.propgenius.cl"
  layout 'mailer'

  def created_rent_charge(renter, rent, property, pdf_string)
    @renter = renter
    @rent = rent
    @property = property

    attachments["CobroArriendo.pdf"] = WickedPdf.new.pdf_from_string(pdf_string)
    mail(to: @renter.email, subject: "Arriendo mes de #{@rent.created_at}")
  end
end
