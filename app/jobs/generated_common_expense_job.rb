class GeneratedCommonExpenseJob < ActiveJob::Base
  queue_as :default

  def perform(renter)
    @renter = renter
    GeneratedCommonExpenseMailer.generated_common_expenses(@renter).deliver_later
  end
end
