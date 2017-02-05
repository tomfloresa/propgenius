class AddBankAcountTypeIdToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :bank_account_type_id, :integer
  end
end
