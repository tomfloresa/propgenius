class CreateCommonExpenseProperties < ActiveRecord::Migration
  def change
    create_table :common_expense_properties do |t|
      t.integer :property_id
      t.float :water
      t.float :gas
      t.float :electricity
      t.float :others
      t.text :details

      t.timestamps null: false
    end
  end
end
