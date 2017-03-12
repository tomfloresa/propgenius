class AddReceiptToCommonExpensePayments < ActiveRecord::Migration
  def self.up
     add_attachment :common_expense_payments, :receipt
   end

   def self.down
     remove_attachment :common_expense_payments, :receipt
   end
end
