class SubunitRent < ActiveRecord::Base
  has_one :rent_payment
  belongs_to :subunit

  def get_overdue_charge
    ## Get the month of charge
    period_month = self.period.month

    ## Get the year of charge
    period_year = self.period.year

    ## Get the payment deadline
    deadline_date = Date.parse("10-#{period_month}-#{period_year}")

    ## Calculate charge
    if Date.today > deadline_date && Date.today <= deadline_date.end_of_month && !self.payed?
      @number_of_days_overdue = (Date.today - deadline_date).to_i
      @overdue_charge = (self.amount * 0.01) * @number_of_days_overdue
    elsif Date.today > deadline_date.end_of_month
      @number_of_days_overdue = (deadline_date.end_of_month - deadline_date).to_i
      @overdue_charge = (self.amount * 0.01) * @number_of_days_overdue
    else
      0
    end
  end
end
