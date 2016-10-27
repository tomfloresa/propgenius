class ChangeTypeToOutcomeType < ActiveRecord::Migration
  def change
    rename_column :outcomes, :type, :outcome_category_id
  end
end
