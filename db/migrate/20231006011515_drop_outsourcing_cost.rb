class OutsourcingCost < ActiveRecord::Migration[6.1]
  def change
    drop_table :outsourcing_costs
  end
end
