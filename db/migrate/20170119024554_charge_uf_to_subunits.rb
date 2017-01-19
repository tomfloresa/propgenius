class ChargeUfToSubunits < ActiveRecord::Migration
  def change
    add_column :subunits, :charge_uf, :boolean
  end
end
