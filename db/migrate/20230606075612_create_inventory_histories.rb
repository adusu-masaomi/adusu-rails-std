class CreateInventoryHistories < ActiveRecord::Migration
  def change
    create_table :inventory_histories do |t|
      t.date :inventory_date
      t.integer :inventory_division_id
      t.integer :construction_datum_id
      t.integer :material_master_id
      t.float :quantity
      t.integer :inventory_quantity
      t.integer :unit_master_id
      t.float :unit_price
      t.integer :price
      t.integer :supplier_master_id
      t.string :slip_code
      t.integer :purchase_datum_id
      t.integer :previous_quantity
      t.float :previous_unit_price
      t.float :current_quantity
      t.float :current_unit_price
      t.integer :current_history_id
      t.date :current_warehousing_date
      t.float :next_quantity_1
      t.float :next_unit_price_1
      t.integer :next_history_id_1
      t.date :next_warehousing_date_1

      t.timestamps null: false
    end
  end
end
