class IdSetMaterialCategories < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('material_categories_id_seq', 123)"
  end
end
