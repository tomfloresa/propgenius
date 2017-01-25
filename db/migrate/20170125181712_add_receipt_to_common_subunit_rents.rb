class AddReceiptToCommonSubunitRents < ActiveRecord::Migration
  def self.up
    add_attachment :subunit_rents, :receipt
  end

  def self.down
    remove_attachment :subunit_rents, :receipt
  end
end
