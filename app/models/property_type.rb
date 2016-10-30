class PropertyType < ActiveRecord::Base
  has_many :subunits
  has_many :properties
end
