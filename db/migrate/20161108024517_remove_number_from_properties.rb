class RemoveNumberFromProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :number
  end
end
