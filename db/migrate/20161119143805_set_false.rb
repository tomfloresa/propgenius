class SetFalse < ActiveRecord::Migration
  def change
    change_column :common_expense_subunits, :payed, :boolean, :default => false
    change_column :subunit_rents, :payed, :boolean, :default => false
  end
end
