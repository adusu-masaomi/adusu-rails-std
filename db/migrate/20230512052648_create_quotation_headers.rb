class CreateQuotationHeaders < ActiveRecord::Migration[6.1]
  def change
    create_table :quotation_headers do |t|
      t.string :quotation_code
      t.string :invoice_code
      t.string :delivery_slip_code
      t.integer :quotation_header_origin_id
      t.date :quotation_date
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
      t.string :trading_method
      t.string :effective_period
      t.integer :quote_price
      t.integer :execution_amount
      t.integer :net_amount
      t.integer :last_line_number
      t.integer :category_saved_flag
      t.integer :category_saved_id
      t.integer :subcategory_saved_id
      t.date :invoice_period_start_date
      t.date :invoice_period_end_date
      t.integer :fixed_flag
      t.integer :not_sum_flag

      t.timestamps null: false
    end
  end
end
