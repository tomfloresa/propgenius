class CreateRentPaymentsTwo < ActiveRecord::Migration
  def change
    create_table :rent_payments do |t|
      t.integer :renter_id
      t.integer :subunit_id
      t.float :amount
      t.integer :payment_method_id
      t.integer :subunit_rent_id
      t.string :receipt_number

      t.timestamps null: false
    end
  end
end
