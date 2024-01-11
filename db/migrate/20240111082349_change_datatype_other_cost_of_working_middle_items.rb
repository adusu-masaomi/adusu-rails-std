class ChangeDatatypeOtherCostOfWorkingMiddleItems < ActiveRecord::Migration[6.1]
  def change
    change_column :working_middle_items, :other_cost, :float
  end
end
