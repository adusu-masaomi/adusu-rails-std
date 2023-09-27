class CreateInvoiceDetailMiddleClassifications < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_detail_middle_classifications do |t|
      t.integer :invoice_header_id
      t.integer :invoice_detail_large_classification_id
      t.integer :invoice_item_division_id
      t.integer :working_middle_item_id
      t.string :working_middle_item_name
      t.string :working_middle_item_short_name
      t.integer :line_number
      t.string :working_middle_specification
      t.float :quantity
      t.float :execution_quantity
      t.integer :working_unit_id
      t.string :working_unit_name
      t.integer :working_unit_price
      t.integer :invoice_price
      t.integer :execution_unit_price
      t.integer :execution_price
      t.integer :material_id
      t.string :working_material_name
      t.integer :material_unit_price
      t.float :labor_unit_price
      t.float :labor_productivity_unit
      t.float :labor_productivity_unit_total
      t.integer :material_quantity
      t.integer :accessory_cost
      t.integer :material_cost_total
      t.integer :labor_cost_total
      t.integer :other_cost
      t.string :remarks
      t.integer :construction_type
      t.integer :piping_wiring_flag
      t.integer :equipment_mounting_flag
      t.integer :labor_cost_flag

      t.timestamps null: false
    end
  end
end
