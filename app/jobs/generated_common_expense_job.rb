class GeneratedCommonExpenseJob < ActiveJob::Base
  queue_as :default

  def perform(renter, pdf_string, common_expense_property)
    @renter = renter
    @pdf_string = pdf_string
    @common_expense_property = common_expense_property

    GeneratedCommonExpenseMailer.generated_common_expense(@renter, @pdf_string, @common_expense_property).deliver_later
  end
end
