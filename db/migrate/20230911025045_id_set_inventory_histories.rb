class IdSetInventoryHistories < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('inventory_histories_id_seq', 6089)"
  end
end
