class CreateStorageInventoryHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :storage_inventory_histories do |t|
      t.date :occurred_date
      t.string :slip_code
      t.integer :purchase_order_datum_id
      t.integer :construction_datum_id
      t.integer :material_master_id
      t.float :quantity
      t.float :unit_price
      t.integer :amount
      t.integer :supplier_master_id
      t.integer :invenrtory_division_id

      t.timestamps
    end
  end
end
