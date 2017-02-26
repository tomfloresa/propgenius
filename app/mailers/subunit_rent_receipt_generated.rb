class SubunitRentReceiptGenerated < ApplicationMailer
  default from: "hola@valprop.propgenius.cl"

  def subunit_rent_receipt_generated(rent_payment, subunit_rent, renter, subunit, property, qrcode, pdf_string)
    @rent_payment = rent_payment
    @subunit_rent = subunit_rent
    @renter = renter
    @subunit = subunit
    @property = property
    @pdf_string = pdf_string
    @qrcode = qrcode

    attachments["ReciboPagoArriendo.pdf"] = WickedPdf.new.pdf_from_string(pdf_string)
    mail(to: "tomas.flores.a@gmail.com", subject: "Pago Arriendo mes de #{@rent_payment.subunit_rent.period}")
  end
end
