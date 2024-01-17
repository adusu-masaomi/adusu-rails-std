class AddBenefitRateToWorkingMiddleItems < ActiveRecord::Migration[6.1]
  def change
    add_column :working_middle_items, :benefit_rate, :float
  end
end
