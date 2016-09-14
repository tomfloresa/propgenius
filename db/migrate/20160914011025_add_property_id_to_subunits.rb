class AddPropertyIdToSubunits < ActiveRecord::Migration
  def change
    add_column :subunits, :property_id, :integer
  end
end
