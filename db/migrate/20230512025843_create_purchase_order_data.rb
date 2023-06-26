class CreatePurchaseOrderData < ActiveRecord::Migration
  def change
    create_table :purchase_order_data do |t|
      t.string :purchase_order_code
      t.integer :construction_datum_id
      t.integer :supplier_master_id
      t.integer :supplier_responsible_id
      t.string :alias_name
      t.date :purchase_order_date
      t.integer :mail_sent_flag

      t.timestamps null: false
    end
  end
end
