class CreatedRentChargeJob < ActiveJob::Base
  queue_as :default

  def perform(renter, rent, property)
    @renter = renter
    @rent = rent
    @property = property
    CreatedRentChargeMailer.created_rent_charge(@renter, @rent, @property).deliver_later
  end
end
