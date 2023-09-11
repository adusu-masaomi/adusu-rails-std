class IdSetInventories < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('inventories_id_seq', 312)"
  end
end
