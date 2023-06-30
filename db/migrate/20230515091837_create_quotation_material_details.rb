class CreateQuotationMaterialDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :quotation_material_details do |t|
      t.integer :quotation_material_header_id
      t.integer :material_id
      t.string :material_code
      t.string :material_name
      t.integer :maker_id
      t.string :maker_name
      t.integer :quantity
      t.integer :unit_master_id
      t.integer :list_price
      t.integer :quotation_unit_price_1
      t.integer :quotation_unit_price_2
      t.integer :quotation_unit_price_3
      t.integer :quotation_price_1
      t.integer :quotation_price_2
      t.integer :quotation_price_3
      t.integer :bid_flag_1
      t.integer :bid_flag_2
      t.integer :bid_flag_3
      t.integer :mail_sent_flag
      t.integer :quotation_email_flag_1
      t.integer :quotation_email_flag_2
      t.integer :quotation_email_flag_3
      t.integer :order_email_flag_1
      t.integer :order_email_flag_2
      t.integer :order_email_flag_3
      t.integer :sequential_id

      t.timestamps null: false
    end
  end
end
