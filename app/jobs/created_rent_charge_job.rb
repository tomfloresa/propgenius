class CreatedRentChargeJob < ActiveJob::Base
  queue_as :default

  def perform(renter, rent)
    @renter = renter
    @rent = rent
    CreatedRentChargeMailer.created_rent_charge(@renter, @rent).deliver_later
  end
end
