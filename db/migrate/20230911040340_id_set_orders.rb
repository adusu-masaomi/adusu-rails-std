class IdSetOrders < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('orders_id_seq', 11072)"
  end
end
