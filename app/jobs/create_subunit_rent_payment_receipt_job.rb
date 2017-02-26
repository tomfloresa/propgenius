class CreateSubunitRentPaymentReceiptJob < ActiveJob::Base
  queue_as :default

  def perform(rent_payment_id, pdf_string)
    pdf_string = pdf_string
    rent_payment = RentPayment.find(rent_payment_id.to_i)

    # use wicked_pdf gem to create PDF from the doc HTML
    doc_pdf = WickedPdf.new.pdf_from_string(pdf_string)

    # save PDF to disk
    path_name =  Rails.root.join('tmp', 'receipts', 'payments_receipts')
    pdf_path = Rails.root.join(path_name, "P#{rent_payment.subunit.property.id}_S#{rent_payment.subunit.id}.pdf")
    File.open(pdf_path, 'wb') do |file|
      file << doc_pdf
    end

    rent_payment.receipt = File.open pdf_path
    rent_payment.save!

    File.delete(pdf_path) if File.exist?(pdf_path)
  end
end
