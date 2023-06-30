class CreatePurchaseOrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_order_histories do |t|
      t.date :purchase_order_date
      t.integer :supplier_master_id
      t.integer :purchase_order_datum_id
      t.integer :mail_sent_flag
      t.integer :delivery_place_flag
      t.string :notes

      t.timestamps null: false
    end
  end
end
