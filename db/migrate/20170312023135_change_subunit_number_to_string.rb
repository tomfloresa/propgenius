class ChangeSubunitNumberToString < ActiveRecord::Migration
  def change
    change_column :subunits, :number, :string
  end
end
