class AddDefaultValuesToCommonExpenses < ActiveRecord::Migration
  def change
    change_column :common_expense_properties, :water, :float, :default => 0
    change_column :common_expense_properties, :gas, :float, :default => 0
    change_column :common_expense_properties, :electricity, :float, :default => 0
    change_column :common_expense_properties, :salary_payments, :float, :default => 0
    change_column :common_expense_properties, :maintenance_payments, :float, :default => 0

    change_column :common_expense_subunits, :electricity_charge, :float, :default => 0
    change_column :common_expense_subunits, :water_charge, :float, :default => 0
    change_column :common_expense_subunits, :gas_charge, :float, :default => 0
    change_column :common_expense_subunits, :others_charge, :float, :default => 0
    change_column :common_expense_subunits, :salary_payments, :float, :default => 0
    change_column :common_expense_subunits, :maintenance_payments, :float, :default => 0
  end
end
