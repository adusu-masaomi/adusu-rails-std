class IdSetPurchaseOrderData < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('purchase_order_data_id_seq', 3897)"
  end
end
