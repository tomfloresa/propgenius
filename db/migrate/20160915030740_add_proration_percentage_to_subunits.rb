class AddProrationPercentageToSubunits < ActiveRecord::Migration
  def change
    add_column :subunits, :proration_percentage, :float
  end
end
