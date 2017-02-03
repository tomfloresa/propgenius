class CreateComunes < ActiveRecord::Migration
  def change
    create_table :comunes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
