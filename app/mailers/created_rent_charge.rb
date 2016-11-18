class CreatedRentCharge < ApplicationMailer
  default from: "hola@valprop.propgenius.cl"
  layout 'mailer'

  def created_rent_charge(renter, rent, property, pdf_string)
    @renter = renter
    @rent = rent
    @property = property

    mail(to: "tomas.flores.a@gmail.com", subject: "Arriendo mes de #{@rent.created_at}")
  end
end
