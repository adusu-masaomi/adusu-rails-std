class IdSetPurchaseData < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('purchase_data_id_seq', 27374)"
  end
end
