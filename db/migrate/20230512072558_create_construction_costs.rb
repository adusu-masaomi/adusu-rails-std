class CreateConstructionCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :construction_costs do |t|
      t.integer :construction_datum_id
      t.integer :purchase_amount
      t.integer :supplies_expense
      t.integer :labor_cost
      t.integer :misellaneous_expense
      t.integer :execution_amount
      t.integer :constructing_amount
      t.string :purchase_order_amount
      t.integer :final_return_division

      t.timestamps null: false
    end
  end
end
