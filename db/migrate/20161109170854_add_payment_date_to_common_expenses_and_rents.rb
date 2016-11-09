class AddPaymentDateToCommonExpensesAndRents < ActiveRecord::Migration
  def change
    add_column :common_expense_payments, :payment_date, :date
    add_column :rent_payments, :payment_date, :date
  end
end
