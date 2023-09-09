class CreateSupplierResponsibles < ActiveRecord::Migration[6.1]
  def change
    create_table :supplier_responsibles do |t|
      t.integer :supplier_master_id
      t.string :responsible_name
      t.string :responsible_email

      t.timestamps null: false
    end
  end
end
