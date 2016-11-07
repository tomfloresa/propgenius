class DropRentPayment < ActiveRecord::Migration
  def change
    drop_table :rent_payments
  end
end
