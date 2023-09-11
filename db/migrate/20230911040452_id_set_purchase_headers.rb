class IdSetPurchaseHeaders < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('purchase_headers_id_seq', 5333)"
  end
end
