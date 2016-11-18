class AddCompanyToPropertiesAndSubunits < ActiveRecord::Migration
  def change
    add_column :properties, :company, :string
    add_column :subunits, :company, :string
  end
end
