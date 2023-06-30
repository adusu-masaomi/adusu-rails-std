class CreatePurchaseHeaders < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_headers do |t|
      t.string :slip_code
      t.integer :complete_flag

      t.timestamps null: false
    end
  end
end
