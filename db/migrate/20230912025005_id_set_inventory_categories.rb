class IdSetInventoryCategories < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('inventory_categories_id_seq', 11)"
  end
end
