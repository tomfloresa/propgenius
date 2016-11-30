class AddReadjustmentDate < ActiveRecord::Migration
  def change
    add_column :subunits, :readjustment_date, :date
  end
end
