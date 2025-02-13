class RemovePrintedFlagFromPurchaseOrderHistories < ActiveRecord::Migration[6.1]
  def change
    remove_column :purchase_order_histories, :printed_flag, :integer
  end
end
