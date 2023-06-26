class CreateCustomerMasters < ActiveRecord::Migration
  def change
    create_table :customer_masters do |t|
      t.string :customer_name
      t.string :search_character
      t.string :post
      t.string :address
      t.string :house_number
      t.string :address2
      t.string :tel_main
      t.string :fax_main
      t.string :email_main
      t.integer :closing_date
      t.integer :closing_date_division
      t.integer :due_date
      t.integer :due_date_division
      t.integer :honorific_id
      t.string :responsible1
      t.string :responsible2
      t.integer :contact_id
      t.integer :payment_bank_id
      t.integer :card_not_flag
      t.integer :contractor_flag
      t.integer :public_flag

      t.timestamps null: false
    end
  end
end
