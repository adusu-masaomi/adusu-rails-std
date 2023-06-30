class CreateWorkingSpecificSmallItems < ActiveRecord::Migration[6.1]
  def change
    create_table :working_specific_small_items do |t|
      t.integer :working_specific_middle_item_id
      t.integer :working_small_item_id
      t.string :working_small_item_code
      t.string :working_small_item_name
      t.float :unit_price
      t.float :rate
      t.integer :quantity
      t.float :material_price
      t.integer :maker_master_id
      t.integer :unit_master_id
      t.float :labor_productivity_unit

      t.timestamps null: false
    end
  end
end
