class RemoveConstructionPeriodFromConstructionCosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :construction_costs, :construction_period_start, :date
    remove_column :construction_costs, :construction_period_end, :date
  end
end
