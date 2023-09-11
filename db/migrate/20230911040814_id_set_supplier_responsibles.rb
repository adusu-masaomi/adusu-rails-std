class IdSetSupplierResponsibles < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('supplier_responsibles_id_seq', 46)"
  end
end
