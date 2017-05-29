class AddRutToCompany < ActiveRecord::Migration
  def change
    add_column :owners, :owner_rut, :string
    add_column :renters, :renter_rut, :string
  end
end
