class IdSetMaterialMasters < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('material_masters_id_seq', 4627)"
  end
end
