class AddColumnsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :comune_id, :integer
    add_column :properties, :lease_startdate, :integer
  end
end
