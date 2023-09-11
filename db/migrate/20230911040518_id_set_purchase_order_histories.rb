class IdSetPurchaseOrderHistories < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('purchase_order_histories_id_seq', 1192)"
  end
end
