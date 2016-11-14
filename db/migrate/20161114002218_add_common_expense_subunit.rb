class AddCommonExpenseSubunit < ActiveRecord::Migration
  def change
    add_column :common_expense_subunits, :common_expense_property_id, :integer
  end
end
