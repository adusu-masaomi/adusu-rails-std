class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :purchase_order_history_id
      t.integer :material_id
      t.string :material_code
      t.string :material_name
      t.integer :maker_id
      t.string :maker_name
      t.integer :quantity
      t.integer :unit_master_id
      t.integer :list_price
      t.float :order_unit_price
      t.integer :order_price
      t.integer :material_category_id
      t.integer :mail_sent_flag
      t.integer :delivery_complete_flag
      t.integer :sequential_id

      t.timestamps null: false
    end
  end
end
