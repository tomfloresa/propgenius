class AddOverdueCharge < ActiveRecord::Migration
  def change
    add_column :subunit_rents, :overdue_charge, :float
  end
end
