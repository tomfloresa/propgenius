# Preview all emails at http://localhost:3000/rails/mailers/created_rent_charge
class CreatedRentChargePreview < ActionMailer::Preview
  def created_rent_charge_preview
    CreatedRentCharge.created_rent_charge(Renter.first, SubunitRent.first)
  end
end
