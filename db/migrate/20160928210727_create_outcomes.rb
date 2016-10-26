class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.date :date
      t.integer :type
      t.integer :property_id
      t.float :ammount
      t.text :details

      t.timestamps null: false
    end
  end
end
