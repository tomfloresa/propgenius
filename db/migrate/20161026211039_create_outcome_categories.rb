class CreateOutcomeCategories < ActiveRecord::Migration
  def change
    create_table :outcome_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
