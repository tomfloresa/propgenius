class CreateCommonExpenseSubunits < ActiveRecord::Migration
  def change
    create_table :common_expense_subunits do |t|
      t.integer :subunit_id
      t.float :electricity_charge
      t.float :water_charge
      t.float :gas_charge
      t.float :others_charge

      t.timestamps null: false
    end
  end
end
