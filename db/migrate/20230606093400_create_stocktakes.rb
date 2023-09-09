class CreateStocktakes < ActiveRecord::Migration[6.1]
  def change
    create_table :stocktakes do |t|
      t.date :stocktake_date
      t.integer :material_master_id
      t.integer :inventory_id
      t.float :physical_quantity
      t.float :unit_price
      t.integer :physical_amount
      t.float :book_quantity
      t.integer :book_amount
      t.integer :inventory_update_flag

      t.timestamps null: false
    end
  end
end
