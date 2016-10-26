class AddAttributesToCommomExpenses < ActiveRecord::Migration
  def change
    add_column :common_expense_properties, :salary_payments, :float
    add_column :common_expense_properties, :maintenance_payments, :float
    add_column :common_expense_properties, :total, :float

    add_column :common_expense_subunits, :salary_payments, :float
    add_column :common_expense_subunits, :maintenance_payments, :float
    add_column :common_expense_subunits, :total, :float
  end
end
