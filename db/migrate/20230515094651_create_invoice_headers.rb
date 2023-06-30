class CreateInvoiceHeaders < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_headers do |t|
      t.string :invoice_code
      t.string :quotation_code
      t.string :delivery_slip_code
      t.date :invoice_date
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
      t.string :construction_place
      t.string :construction_house_number
      t.string :construction_place2
      t.string :payment_period
      t.date :invoice_period_start_date
      t.date :invoice_period_end_date
      t.integer :billing_amount
      t.integer :execution_amount
      t.integer :deposit_amount
      t.integer :payment_method_id
      t.integer :commission
      t.integer :payment_date
      t.integer :labor_insurance_not_flag
      t.integer :last_line_number
      t.string :remarks
      t.integer :final_return_division
      t.integer :deposit_complete_flag

      t.timestamps null: false
    end
  end
end
