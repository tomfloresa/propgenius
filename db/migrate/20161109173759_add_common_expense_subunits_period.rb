class AddCommonExpenseSubunitsPeriod < ActiveRecord::Migration
  def change
    add_column :common_expense_subunits, :period, :date
  end
end
