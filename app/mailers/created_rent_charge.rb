class CreatedRentCharge < ApplicationMailer
  default from: "hola@valprop.propgenius.cl"

  def created_rent_charge(renter, rent, property)
    @renter = renter
    @rent = rent
    @property = property
    mail(to: @renter.email, subject: "Arriendo mes de #{@rent.created_at}")
  end
end
