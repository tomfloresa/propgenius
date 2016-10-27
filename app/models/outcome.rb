class Outcome < ActiveRecord::Base
  belongs_to :property
  belongs_to :outcome_category
end
