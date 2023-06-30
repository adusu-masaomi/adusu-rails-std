class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :representative_title
      t.string :representative_name
      t.string :post
      t.string :address
      t.string :house_number
      t.string :address2
      t.string :tel
      t.string :fax
      t.string :email
      t.string :invoice_number
      t.integer :estimate_labor_cost
      t.string :responsible_order
      t.string :responsible_estimate
      t.string :responsible_invoice
      t.string :responsible_delivery
      t.string :bank_name_1
      t.string :bank_branch_name_1
      t.integer :account_type_1
      t.string :account_number_1
      t.string :holder_1
      t.string :bank_name_2
      t.string :bank_branch_name_2
      t.integer :account_type_2
      t.string :account_number_2
      t.string :holder_2
      t.string :bank_name_3
      t.string :bank_branch_name_3
      t.integer :account_type_3
      t.string :account_number_3
      t.string :holder_3

      t.timestamps null: false
    end
  end
end
