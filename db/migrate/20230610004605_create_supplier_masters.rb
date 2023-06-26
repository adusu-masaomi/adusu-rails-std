class CreateSupplierMasters < ActiveRecord::Migration
  def change
    create_table :supplier_masters do |t|
      t.string :supplier_name
      t.string :tel_main
      t.string :fax_main
      t.string :email_main
      t.string :responsible1
      t.string :email1
      t.string :responsible2
      t.string :email2
      t.string :responsible3
      t.string :email3
      t.string :responsible_cc
      t.string :email_cc
      t.string :search_character
      t.integer :outsourcing_flag
      t.string :post
      t.string :address
      t.string :bank_name
      t.string :bank_branch_name
      t.integer :account_type
      t.string :account_number
      t.string :holder
      t.string :responsible_title
      t.string :responsible_name

      t.timestamps null: false
    end
  end
end
