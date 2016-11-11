class CreatedRentChargeJob < ActiveJob::Base
  queue_as :default

  def perform(renter, rent, property, pdf_string)
    @renter = renter
    @rent = rent
    @property = property
    @pdf_string = pdf_string
    CreatedRentCharge.created_rent_charge(@renter, @rent, @property, @pdf_string).deliver_later
  end
end
