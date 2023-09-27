class CreateInvoiceDetailLargeClassifications < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_detail_large_classifications do |t|
      t.integer :invoice_header_id
      t.integer :invoice_items_division_id
      t.integer :working_large_item_id
      t.string :working_large_item_name
      t.string :working_large_item_short_name
      t.string :working_large_specification
      t.integer :line_number
      t.float :quantity
      t.float :execution_quantity
      t.integer :working_unit_id
      t.string :working_unit_name
      t.integer :working_unit_price
      t.integer :invoice_price
      t.integer :execution_unit_price
      t.integer :execution_price
      t.float :labor_productivity_unit
      t.float :labor_productivity_unit_total
      t.integer :last_line_number
      t.string :remarks
      t.integer :delivery_slip_header_id
      t.integer :construction_type
      t.integer :piping_wiring_flag
      t.integer :equipment_mounting_flag
      t.integer :labor_cost_flag

      t.timestamps null: false
    end
  end
end
