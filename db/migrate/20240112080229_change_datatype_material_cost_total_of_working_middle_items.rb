class ChangeDatatypeMaterialCostTotalOfWorkingMiddleItems < ActiveRecord::Migration[6.1]
  def change
    change_column :working_middle_items, :material_cost_total, :float
  end
end
