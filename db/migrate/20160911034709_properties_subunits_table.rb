class PropertiesSubunitsTable < ActiveRecord::Migration
  def change
    create_table :properties_subunits, id:false do |t|
      t.belongs_to :property, index: true
      t.belongs_to :subunit, index: true
    end
  end
end
