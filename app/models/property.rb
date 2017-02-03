class Property < ActiveRecord::Base
  belongs_to :owner
  belongs_to :renter
  belongs_to :property_type
  belongs_to :bank
  belongs_to :comune
  has_many :subunits
  has_many :common_expense_properties
  has_many :outcomes

  def address_and_number
    "#{self.address}"
  end
end
