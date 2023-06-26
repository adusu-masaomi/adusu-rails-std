class CreatePurchaseUnitPrices < ActiveRecord::Migration
  def change
    create_table :purchase_unit_prices do |t|
      t.integer :supplier_id
      t.integer :material_id
      t.string :supplier_material_code
      t.float :unit_price, precision: 11, scale: 2
      t.integer :list_price
      t.integer :unit_id

      t.timestamps null: false
    end
  end
end
