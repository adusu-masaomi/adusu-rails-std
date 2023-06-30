class CreateConstants < ActiveRecord::Migration[6.1]
  def change
    create_table :constants do |t|
      t.string :purchase_order_last_header_code

      t.timestamps null: false
    end
  end
end
