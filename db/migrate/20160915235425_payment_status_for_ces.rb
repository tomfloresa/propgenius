class PaymentStatusForCes < ActiveRecord::Migration
  def change
    add_column :common_expense_subunits, :payed, :boolean
  end
end
