class AddPeriodToSubunitRentCharge < ActiveRecord::Migration
  def change
    add_column :subunit_rents, :period, :date
  end
end
