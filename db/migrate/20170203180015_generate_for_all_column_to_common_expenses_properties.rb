class GenerateForAllColumnToCommonExpensesProperties < ActiveRecord::Migration
  def change
    add_column :common_expense_properties, :generate_for_subunits, :boolean
  end
end
