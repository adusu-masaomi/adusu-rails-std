class AddPeriodToPurchaseData < ActiveRecord::Migration[6.1]
  def change
    add_column :purchase_data, :construction_period_start, :date
    add_column :purchase_data, :construction_period_end, :date
  end
end
