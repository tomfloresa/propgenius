class Subunit < ActiveRecord::Base
  belongs_to :owner
  belongs_to :renter
  belongs_to :property
  belongs_to :property_type
  has_many :common_expense_subunits
  has_many :rent_payments
  has_many :common_expense_payments
  has_many :subunit_rents

  def address_and_number
    "#{self.property.address}, Nº#{self.number}"
  end
end
