class CreateImportantNumericalValues < ActiveRecord::Migration
  def change
    create_table :important_numerical_values do |t|
      t.string :name
      t.float :value

      t.timestamps null: false
    end
  end
end
