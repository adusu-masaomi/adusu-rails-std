class IdSetOrders < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('orders_id_seq', 11071)"
  end
end
