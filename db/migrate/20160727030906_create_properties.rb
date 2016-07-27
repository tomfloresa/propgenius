class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address
      t.float :square_meters
      t.integer :property_type_id
      t.integer :renter_id
      t.float :rent_value
      t.integer :number
      t.integer :subunits_number

      t.timestamps null: false
    end
  end
end
