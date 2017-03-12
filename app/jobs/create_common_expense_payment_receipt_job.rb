class CreateCommonExpensePaymentReceiptJob < ActiveJob::Base
  queue_as :default

  def perform(common_expense_payment_id, pdf_string)
    pdf_string = pdf_string
    common_expense_payment = CommonExpensePayment.find(common_expense_payment_id.to_i)

    # use wicked_pdf gem to create PDF from the doc HTML
    doc_pdf = WickedPdf.new.pdf_from_string(pdf_string)

    # save PDF to disk
    path_name =  Rails.root.join('tmp', 'receipts', 'common_expense_receipts')
    pdf_path = Rails.root.join(path_name, "P#{common_expense_payment.subunit.property.id}_S#{common_expense_payment.subunit.id}.pdf")
    File.open(pdf_path, 'wb') do |file|
      file << doc_pdf
    end

    common_expense_payment.receipt = File.open pdf_path
    common_expense_payment.save!

    File.delete(pdf_path) if File.exist?(pdf_path)
  end
end
