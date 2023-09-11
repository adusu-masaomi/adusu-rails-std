class IdSetPurchaseDivisions < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('purchase_divisions_id_seq', 5)"
  end
end
