class CreateWorkingSmallItems < ActiveRecord::Migration
  def change
    create_table :working_small_items do |t|
      t.integer :working_middle_item_id
      t.integer :working_small_item_id
      t.string :working_small_item_code
      t.string :working_small_item_name
      t.float :rate
      t.float :unit_price
      t.integer :quantity
      t.float :material_price
      t.integer :maker_master_id
      t.integer :unit_master_id
      t.float :labor_productivity_unit

      t.timestamps null: false
    end
  end
end
