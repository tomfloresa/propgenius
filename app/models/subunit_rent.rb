class SubunitRent < ActiveRecord::Base
  has_one :rent_payment
  belongs_to :subunit

  def get_overdue_charge
    period_month = self.period.month
    period_year = self.period.year
    deadline_date = Date.parse("10-#{period_month}-#{period_year}")
    if Date.today > deadline_date && !self.payed?
      @number_of_days_overdue = (Date.today - deadline_date).to_i
      @overdue_charge = (self.amount * 0.01) * @number_of_days_overdue
    else
      0
    end
  end
end
