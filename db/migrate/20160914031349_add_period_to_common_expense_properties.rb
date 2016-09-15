class AddPeriodToCommonExpenseProperties < ActiveRecord::Migration
  def change
    add_column :common_expense_properties, :period, :date
  end
end
