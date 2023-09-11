class IdSetSupplierMasters < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('supplier_masters_id_seq', 111)"
  end
end
