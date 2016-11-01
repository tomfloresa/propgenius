class ChangeNameToAmounColumn < ActiveRecord::Migration
  def change
    rename_column :subunit_rents, :amoun, :amount
  end
end
