class CreateConstructionData < ActiveRecord::Migration[6.1]
  def change
    create_table :construction_data do |t|
      t.string :construction_code
      t.string :construction_name
      t.string :alias_name
      t.date :reception_date
      t.integer :customer_id
      t.string :personnel
      t.integer :site_id
      t.date :construction_start_date
      t.date :construction_end_date
      t.date :construction_period_start
      t.date :construction_period_end
      t.string :post
      t.string :address
      t.string :house_number
      t.string :address2
      t.decimal :latitude
      t.decimal :longitude
      t.string :construction_detail
      t.string :attention_matter
      t.integer :working_safety_matter_id
      t.string :working_safety_matter_name
      t.integer :estimated_amount
      t.integer :final_amount
      t.date :billing_due_date
      t.date :deposit_due_date
      t.date :deposit_date
      t.integer :quotation_header_id
      t.integer :delivery_slip_header_id
      t.integer :billed_flag
      t.integer :calculated_flag
      t.integer :order_flag
      t.integer :quotation_flag

      t.timestamps null: false
    end
  end
end
