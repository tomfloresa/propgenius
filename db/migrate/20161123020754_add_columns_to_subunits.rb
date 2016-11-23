class AddColumnsToSubunits < ActiveRecord::Migration
  def change
    add_column :subunits, :lease_duration, :integer
    add_column :subunits, :lease_end_date, :date
  end
end
