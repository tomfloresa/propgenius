class CreateElectricityReadings < ActiveRecord::Migration
  def change
    create_table :electricity_readings do |t|
      t.integer :subunit_id
      t.integer :property_id
      t.date :period
      t.float :total_reading

      t.timestamps null: false
    end
  end
end
