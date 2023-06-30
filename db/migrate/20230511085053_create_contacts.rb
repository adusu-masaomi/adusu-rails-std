class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :search_character
      t.string :company_name
      t.string :affiliation
      t.string :department
      t.string :post
      t.string :address
      t.string :tel
      t.string :fax
      t.string :email
      t.string :url
      t.integer :partner_division_id

      t.timestamps null: false
    end
  end
end
