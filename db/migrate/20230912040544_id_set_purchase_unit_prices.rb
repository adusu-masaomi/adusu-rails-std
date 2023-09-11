class IdSetPurchaseUnitPrices < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('purchase_unit_prices_id_seq', 6523)"
  end
end
