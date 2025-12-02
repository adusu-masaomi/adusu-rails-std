class AddPeriodToConstructionCosts < ActiveRecord::Migration[6.1]
  def change
    add_column :construction_costs, :construction_period_start, :date
    add_column :construction_costs, :construction_period_end, :date
  end
end
