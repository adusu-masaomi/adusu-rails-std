class IdSetCustomerMasters < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('customer_masters_id_seq', 196)"
  end
end
