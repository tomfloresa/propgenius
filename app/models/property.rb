class Property < ActiveRecord::Base
  belongs_to :owner
  belongs_to :renter
end
