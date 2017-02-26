class RentPayment < ActiveRecord::Base
  belongs_to :subunit
  belongs_to :renter
  belongs_to :subunit_rent
  belongs_to :payment_method

  has_attached_file :receipt
  validates_attachment_content_type :receipt, content_type: ['application/pdf']
end
