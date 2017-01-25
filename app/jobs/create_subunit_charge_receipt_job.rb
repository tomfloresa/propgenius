class CreateSubunitChargeReceiptJob < ActiveJob::Base
  queue_as :default

  def perform(subunit_rent_id, pdf_string)
    pdf_string = pdf_string
    subunit_rent = SubunitRent.find(subunit_rent_id.to_i)

    # use wicked_pdf gem to create PDF from the doc HTML
    doc_pdf = WickedPdf.new.pdf_from_string(pdf_string)

    # save PDF to disk
    path_name =  Rails.root.join('tmp', 'receipts', 'subunit_rent_receipts')
    pdf_path = Rails.root.join(path_name, "P#{subunit_rent.subunit.property.id}_S#{subunit_rent.subunit.id}.pdf")
    File.open(pdf_path, 'wb') do |file|
      file << doc_pdf
    end

    subunit_rent.receipt = File.open pdf_path
    subunit_rent.save!

    File.delete(pdf_path) if File.exist?(pdf_path)
  end
end
