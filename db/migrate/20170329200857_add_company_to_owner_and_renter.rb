class AddCompanyToOwnerAndRenter < ActiveRecord::Migration
  def change
    add_column :owners, :company_name, :string
    add_column :renters, :company_name, :string
  end
end
