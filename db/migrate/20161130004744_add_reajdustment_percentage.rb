class AddReajdustmentPercentage < ActiveRecord::Migration
  def change
    add_column :subunits, :readjustment_percentage, :float
    add_column :subunits, :readjustment_months_period, :integer
  end
end
