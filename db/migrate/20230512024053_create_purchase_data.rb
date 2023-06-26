class CreatePurchaseData < ActiveRecord::Migration
  def change
    create_table :purchase_data do |t|
      t.date :purchase_date
      t.string :slip_code
      t.integer :purchase_order_datum_id
      t.integer :construction_datum_id
      t.integer :material_id
      t.string :material_code
      t.string :material_name
      t.integer :maker_id
      t.string :maker_name
      t.float :quantity
      t.float :quantity2
      t.integer :unit_id
      t.float :purchase_unit_price
      t.float :purchase_unit_price2
      t.integer :purchase_amount
      t.integer :list_price
      t.integer :purchase_id
      t.integer :division_id
      t.integer :supplier_id
      t.integer :inventory_division_id
      t.integer :unit_price_not_update_flag
      t.integer :outsourcing_invoice_flag
      t.integer :outsourcing_payment_flag
      t.integer :purchase_header_id
      t.date :working_end_date
      t.date :closing_date
      t.date :payment_due_date
      t.date :payment_date
      t.date :unpaid_payment_date
      t.string :notes

      t.timestamps null: false
    end
  end
end
