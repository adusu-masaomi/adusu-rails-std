class AddPrintedFlagToPurchaseOrderHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :purchase_order_histories, :printed_flag, :integer
  end
end
