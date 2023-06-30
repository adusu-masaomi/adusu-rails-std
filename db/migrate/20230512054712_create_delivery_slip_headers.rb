class CreateDeliverySlipHeaders < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_slip_headers do |t|
      t.string :delivery_slip_code
      t.string :quotation_code
      t.string :invoice_code
      t.integer :delivery_slip_header_origin_id
      t.date :delivery_slip_date
      t.integer :construction_datum_id
      t.string :construction_name
      t.integer :customer_id
      t.string :customer_name
      t.integer :honorific_id
      t.string :responsible1
      t.string :responsible2
      t.string :post
      t.string :address
      t.string :house_number
      t.string :address2
      t.string :tel
      t.string :fax
      t.string :construction_period
      t.date :construction_period_date1
      t.date :construction_period_date2
      t.string :construction_post
      t.string :construction_place
      t.string :construction_house_number
      t.string :construction_place2
      t.integer :delivery_amount
      t.integer :execution_amount
      t.integer :last_line_number
      t.integer :category_saved_flag
      t.integer :category_saved_id
      t.integer :subcategory_saved_id
      t.integer :fixed_flag
      t.integer :final_return_division

      t.timestamps null: false
    end
  end
end
