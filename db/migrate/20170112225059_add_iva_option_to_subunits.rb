class AddIvaOptionToSubunits < ActiveRecord::Migration
  def change
    add_column :subunits, :charge_iva, :boolean
  end
end
