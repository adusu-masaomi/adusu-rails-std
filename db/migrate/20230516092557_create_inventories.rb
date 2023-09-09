class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.integer :warehouse_id
      t.integer :location_id
      t.integer :material_master_id
      t.float :inventory_quantity
      t.integer :unit_master_id
      t.integer :inventory_amount
      t.integer :supplier_master_id
      t.integer :current_history_id
      t.date :current_warehousing_date
      t.float :current_quantity
      t.float :current_unit_price
      t.date :last_warehousing_date
      t.float :last_unit_price
      t.integer :next_history_id_1
      t.date :next_warehousing_date_1
      t.float :next_quantity_1
      t.float :next_unit_price_1
      t.integer :next_history_id_2
      t.date :next_warehousing_date_2
      t.float :next_quantity_2
      t.float :next_unit_price_2
      t.integer :no_stocktake_flag
      t.string :image

      t.timestamps null: false
    end
  end
end
