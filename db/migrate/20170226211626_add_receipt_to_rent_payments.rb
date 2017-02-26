class AddReceiptToRentPayments < ActiveRecord::Migration
  def self.up
     add_attachment :rent_payments, :receipt
   end

   def self.down
     remove_attachment :rent_payments, :receipt
   end
 end
