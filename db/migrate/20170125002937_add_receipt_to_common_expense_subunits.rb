class AddReceiptToCommonExpenseSubunits < ActiveRecord::Migration
  def self.up
    add_attachment :common_expense_subunits, :receipt
  end

  def self.down
    remove_attachment :common_expense_subunits, :receipt
  end
end
