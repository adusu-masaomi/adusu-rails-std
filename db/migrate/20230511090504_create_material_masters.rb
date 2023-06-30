class CreateMaterialMasters < ActiveRecord::Migration[6.1]
  def change
    create_table :material_masters do |t|
      t.string :material_code
      t.string :internal_code
      t.string :material_name
      t.integer :maker_id
      t.integer :unit_id
      t.integer :list_price
      t.integer :list_price_quotation
      t.integer :standard_quantity
      t.float :standard_labor_productivity_unit
      t.float :standard_rate
      t.float :last_unit_price
      t.date :last_unit_price_update_at
      t.integer :inventory_category_id
      t.integer :material_category_id
      t.date :list_price_update_at
      t.string :notes

      t.timestamps null: false
    end
  end
end
