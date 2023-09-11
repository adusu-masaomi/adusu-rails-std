class IdSetQuotationMaterialHeaders < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('quotation_material_headers_id_seq', 241)"
  end
end
