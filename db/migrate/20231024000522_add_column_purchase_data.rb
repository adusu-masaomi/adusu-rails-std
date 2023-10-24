class AddColumnPurchaseData < ActiveRecord::Migration[6.1]
  def change
    add_column :purchase_data, :purchase_unit_price_tax, :integer
  end
end
