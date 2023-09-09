class CreateQuotationMaterialHeaders < ActiveRecord::Migration[6.1]
  def change
    create_table :quotation_material_headers do |t|
      t.string :quotation_code
      t.date :requested_date
      t.integer :construction_datum_id
      t.integer :supplier_master_id
      t.string :responsible
      t.string :email
      t.integer :delivery_place_flag
      t.string :notes_1
      t.string :notes_2
      t.string :notes_3
      t.integer :quotation_header_origin_id
      t.integer :total_quotation_price_1
      t.integer :total_quotation_price_2
      t.integer :total_quotation_price_3
      t.integer :total_order_price_1
      t.integer :total_order_price_2
      t.integer :total_order_price_3
      t.integer :supplier_id_1
      t.integer :supplier_id_2
      t.integer :supplier_id_3
      t.integer :supplier_responsible_id_1
      t.integer :supplier_responsible_id_2
      t.integer :supplier_responsible_id_3
      t.integer :quotation_email_flag_1
      t.integer :quotation_email_flag_2
      t.integer :quotation_email_flag_3
      t.integer :order_email_flag_1
      t.integer :order_email_flag_2
      t.integer :order_email_flag_3
      t.integer :all_bid_flag_1
      t.integer :all_bid_flag_2
      t.integer :all_bid_flag_3

      t.timestamps null: false
    end
  end
end
