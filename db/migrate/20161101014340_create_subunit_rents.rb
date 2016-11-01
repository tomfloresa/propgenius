class CreateSubunitRents < ActiveRecord::Migration
  def change
    create_table :subunit_rents do |t|
      t.integer :subunit_id
      t.float :amoun
      t.boolean :payed

      t.timestamps null: false
    end
  end
end
