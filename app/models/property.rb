class Property < ActiveRecord::Base
  belongs_to :owner
  belongs_to :renter
  has_many :subunits
end
