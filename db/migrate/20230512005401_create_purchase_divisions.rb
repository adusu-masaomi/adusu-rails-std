class CreatePurchaseDivisions < ActiveRecord::Migration
  def change
    create_table :purchase_divisions do |t|
      t.string :purchase_division_name
      t.string :purchase_division_long_name

      t.timestamps null: false
    end
  end
end
