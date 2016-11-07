class AddBankAndBankAccountToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :bank_id, :integer
    add_column :properties, :bank_account_number, :string
  end
end
