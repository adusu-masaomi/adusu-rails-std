class CreateStorageInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :storage_inventories do |t|
      t.integer :warehouse_id
      t.integer :location_id
      t.integer :material_master_id
      t.integer :quantity
      t.integer :unit_master_id
      t.float :unit_price

      t.timestamps
    end
  end
end
