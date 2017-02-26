class CreatedSubunitRentPaymentJob < ActiveJob::Base
  queue_as :default

  def perform(rent_payment, subunit_rent, renter, subunit, property, qrcode, pdf_string)
    @rent_payment = rent_payment
    @subunit_rent = subunit_rent
    @renter = renter
    @subunit = subunit
    @property = property
    @pdf_string = pdf_string
    @qrcode = qrcode

    SubunitRentReceiptGenerated.subunit_rent_receipt_generated(@rent_payment, @subunit_rent, @renter, @subunit, @property, @qrcode, @pdf_string).deliver_later
  end
end
