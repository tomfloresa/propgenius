class CreateSubunits < ActiveRecord::Migration
  def change
    create_table :subunits do |t|
      t.float :square_meters
      t.integer :property_type_id
      t.integer :renter_id
      t.float :rent_value
      t.integer :number
      t.date :lease_startdate
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
